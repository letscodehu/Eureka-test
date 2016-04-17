var http = require('http');
// eureka kliensünk
var eureka = require("eureka-js-client").Eureka;
// csak az egyedi hostname miatt
var md5 = require("md5");
// eureka configja
var euConfig = require("./config").config.eureka;

var euClient = new eureka({
    // application instance information
    instance: {
        app: "balancer",
        hostName: md5(Date.now()),
        ipAddr: '127.0.0.1',
        port: 5000,
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
    i = (i >= ret.length) ? 0 : (i + 1);
    return ret[i];
}

http.createServer(function (req, res) {
    var instance = getWorkingInstance("aggregatorService");
    var request = http.get({
        "host" : instance.host,
        "port" : instance.port
    },function(response) {
        response.pipe(res);
    });
    request.on("error", function() {
        res.end(JSON.stringify({
            "error" : "Unable to serve your request!"
        }));
    });

    request.end();
}).listen(5000);