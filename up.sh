#!/bin/bash

# Create a network for the cluster
# Make sure that the ip-range is not overlapping with your exist networks in your docker network
docker network create --driver bridge --subnet=172.99.0.0/16 --ip-range=172.99.10.0/24  galera-cluster-network
cd db01 && docker-compose up -d
sleep 10
docker-compose exec -T db mysql -u root -e "SHOW STATUS LIKE 'wsrep_cluster%';"
docker-compose exec -T db mysql -u root -e "CREATE USER 'mariabackup'@'localhost' IDENTIFIED BY 'mypassword';"
docker-compose exec -T db mysql -u root -e "GRANT RELOAD, PROCESS, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'mariabackup'@'localhost';"
cd ../db02 && docker-compose up -d &
cd ../db03 && docker-compose up -d & 
