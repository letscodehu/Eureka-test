#! /bin/sh

DOCKER_HOST=172.17.42.1

# MySQL
docker run -d -p 12805:3306 --name accounts_mysql -e MYSQL_ROOT_PASSWORD=password mysql:latest
docker run -d -p 12806:3306 --name products_mysql -e MYSQL_ROOT_PASSWORD=password mysql:latest
docker run -d -p 12807:3306 --name orders_mysql -e MYSQL_ROOT_PASSWORD=password mysql:latest

# Redis

docker run -d -p 10564:6379 --name accounts-redis redis
docker run -d -p 10565:6379 --name products-redis redis
docker run -d -p 10566:6379 --name orders-redis redis

sleep 180 # Wait for MySQL to get it's shit together

cat accounts.sql | mysql --host=0.0.0.0 --port=12805 --password=password
cat products.sql | mysql --host=0.0.0.0 --port=12806 --password=password
cat orders.sql | mysql --host=0.0.0.0 --port=12807 --password=password

# Build services

cp AccountServiceDockerfile Dockerfile
docker build -t account-service .
cp ProductServiceDockerfile Dockerfile
docker build -t product-service .
cp OrderServiceDockerfile Dockerfile
docker build -t order-service .
cp AggregatorServiceDockerfile Dockerfile
docker build -t aggregator-service .
cp BalancerServiceDockerfile Dockerfile
docker build -t balancer-service .

# Run services
docker run -d -p  13333:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13333 --name product_1 product-service
docker run -d -p  13334:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13334 --name product_2 product-service
docker run -d -p  13335:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13335 --name product_3 product-service
docker run -d -p  13336:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13336 --name order_1 order-service
docker run -d -p  13337:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13337 --name order_2 order-service
docker run -d -p  13338:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13338 --name order_3 order-service
docker run -d -p  13339:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13339 --name account_1 account-service
docker run -d -p  13340:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13340 --name account_2 account-service
docker run -d -p  13341:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13341 --name account_3 account-service

docker run -d -p  13342:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13342 --name aggregator_1 aggregator-service
docker run -d -p  13343:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13343 --name aggregator_2 aggregator-service

docker run -d -p  13344:5000 -e DOCKER_HOST=$DOCKER_HOST -e DOCKER_PORT=13344 --name balancer_1 balancer-service
