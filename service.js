// a service típusa
var serviceType = process.argv.pop();

var port = 5005;

var express = require('express');
// eureka kliensünk
var eureka = require("eureka-js-client").Eureka;
// csak az egyedi hostname miatt
var md5 = require("md5");

// redis
var redis = require("redis");
var mysql = require("mysql");

// config
var config = require("./config").config[serviceType];
// eureka configja
var euConfig = require("./config").config.eureka;


var redisClient = redis.createClient({
    "host" : config.redis.host,
    "port" : config.redis.port
});

var connection = mysql.createConnection({
    port    : config.mysql.port,
    host     : config.mysql.host,
    user     : config.mysql.username,
    password : config.mysql.password,
    database : config.mysql.database
});

connection.connect(function(err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }
    console.log('connected as id ' + connection.threadId);
});

var app = express();

var euClient = new eureka({
    // application instance information
    instance: {
        app: config.serviceName,
        hostName: md5(Date.now()),
        ipAddr: process.env.DOCKER_HOST || '127.0.0.1',
        port: process.env.DOCKER_PORT || port,
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
// beregisztrálunk az eurekára és küldjük az életjeleket
euClient.start();

// ne vegyünk példát a szerkezetről, az anonymous function-öket kerüljük máskor
app.get('/', function (req, res) {
    // meglessük a cache-t
    redisClient.get("accounts", function(err, reply) {
        if (err != null || reply == null) {
    // nem visszük túlzásba a dolgokat, csak a példa kedvéért
            connection.query('SELECT * FROM ' + config.mysql.table, function(err, rows) {
                if (err) {
                    console.error('error connecting: ' + err.stack);
                    res.end();
                }
                console.log("sql-ből");
                res.end(JSON.stringify(rows));
                redisClient.set("accounts", JSON.stringify(rows));
            });
            return;
        }
        console.log("redis-ből");
        res.end(reply);
    });
});

app.listen(port);

module.exports = app;