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

