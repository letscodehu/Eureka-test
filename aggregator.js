var express = require('express');
// eureka kliensünk
var eureka = require("eureka-js-client").Eureka;
// csak az egyedi hostname miatt
var md5 = require("md5");
var config = require("./config").config.aggregator;

// eureka configja
var euConfig = require("./config").config.eureka;

var http = require("http");

var app = express();

var hostName = md5(Date.now());
var euClient = new eureka({
    // application instance information
    instance: {
        app: config.serviceName,
        hostName: hostName,
        ipAddr: process.env.DOCKER_HOST,
        port: process.env.DOCKER_PORT,
        vipAddress: 'jq.test.something.com',
        dataCenterInfo: {
            name: 'MyOwn'
        }
    },
    eureka: {
        // eureka server host / port
        host: euConfig.host,
        port: euConfig.port
    }
});

euClient.start();

// a kezdőindex
var i = 0;
// ez fog kidobni nekünk egy instance-t a service-ből
function getWorkingInstance(name) {
    var instances = euClient.getInstancesByAppId(name);
    var ret = [];

    if (instances) {
        // előszűrűnk, hogy csak a működőek legyenek benne
        instances.forEach(function(instance) {
            if (instance.status !== "UP") {
                return;
            }
            ret.push({
                // csak a host és a port érdekel minket
                "host" : instance.ipAddr,
                "port" : instance.port.$
            });
        });
    }
    i = (i >= ret.length -1 ) ? 0 : (i + 1);
    return ret[i];
}

function getPromiseWithData(hostPortConfig, fieldName) {
    return new Promise(function(resolve, reject) {
        var request = http.get({
            "host":  hostPortConfig.host,
            "port": hostPortConfig.port,
            "path": "/"
        }, function(response) {
            var data = "";
            response.on("data", function(chunk) {
                data += chunk;
            });
            response.on("end", function() {
                var response = {
                    "key" : fieldName,
                    "data" :JSON.parse(data)
                };
                resolve(response);
            });
        });
        request.on("error", function(err) {
            reject(err);
        });

        request.end();
    });
}

app.get("/", function(req, res) {
    var productService = getWorkingInstance("productService");
    var orderService = getWorkingInstance("orderService");
    var accountService = getWorkingInstance("accountService");

    var product = getPromiseWithData(productService, "products");
    var account = getPromiseWithData(accountService, "accounts");
    var order = getPromiseWithData(orderService, "orders");

    Promise.all([product, account, order]).then(function(values) {
        var responseObj = {};
        values.forEach(function(item) {
            responseObj.hostId = hostName;
            responseObj[item.key] = item.data;
        });
        res.end(JSON.stringify(responseObj));
    }, function(err) {
        console.log(err);
        res.end(JSON.stringify({
            "error" : "Sorry, we cant fulfill your request!"
        }));
    });
});

app.listen(5000);

module.exports = app;
