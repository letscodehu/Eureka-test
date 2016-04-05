/**
 * Created by tacsi on 2016. 04. 03..
 */
var express = require('express');
var eureka = require("eureka-js-client").Eureka;


var euClient = new eureka({
    // application instance information
    instance: {
        app: 'rucsokservice',
        hostName: 'localhost',
        ipAddr: '127.0.0.1',
        port: 5000,
        vipAddress: 'jq.test.something.com',
        dataCenterInfo: {
            name: 'MyOwn'
        }
    },
    eureka: {
        // eureka server host / port
        host: '192.168.0.6',
        port: 32874
    }
});

euClient.start();

var app = express();

app.get('/', function (req, res) {
    res.send('hello jenkins');
});

app.listen(process.env.PORT || 5000);

module.exports = app;