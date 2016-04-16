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
        port: 8000,
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


function getWorkingInstance(name) {
    var instances = euClient.getInstancesByAppId(name);
    var ret = [];
    if (instances) {

        instances.forEach(function(instance) {
            if (instance.status !== "UP") {
                return;
            }
            ret.push({
                "host" : (instance.ipAddr !== '127.0.0.1') ? instance.ipAddr : process.env.DOCKER_HOST,
                "port" : instance.port.$
            });
        });
    }
    return ret;
}
var i = 0;
http.createServer(function (req, res) {
    var instances = getWorkingInstance("aggregatorService");
    i = (i + 1) % instances.length;
    console.log(instances);
    http.get({
        "host" : instances[i].host,
        "port" : instances[i].port
    },function(response) {
        response.pipe(res);
    }, function(err) {
        console.log(err);
    }).end();
}).listen(5000);
