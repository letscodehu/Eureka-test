#! /bin/sh

DOCKER_HOST=172.17.42.1

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
