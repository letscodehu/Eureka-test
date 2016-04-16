var docker0 = "172.17.42.1";

exports.config = {
    eureka : {
        host : docker0,
        port : 32784
    },
    aggregator : {
        serviceName : "aggregatorService"
    },
    accounts : {
        serviceName : "accountService",
        mysql : {
            host : docker0,
            port : 12805,
            table : "accounts",
            database : "account",
            "username" : "root",
            "password" : "password"
        },
        redis : {
            host : docker0,
            port : 10564
        }
    },
    orders : {
        serviceName : "orderService",
        mysql : {
            host : docker0,
            port : 12807,
            table : "orders",
            database : "order",
            "username" : "root",
            "password" : "password"
        },
        redis : {
            host : docker0,
            port : 10565
        }
    },
    products : {
        serviceName : "productService",
        mysql : {
            host : docker0,
            port : 12806,
            table : "products",
            database : "product",
            "username" : "root",
            "password" : "password"
        },
        redis : {
            host : docker0,
            port : 10566
        }
    }
};