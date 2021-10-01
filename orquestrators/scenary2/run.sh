#!/bin/bash

sudo docker-compose -f core-compose.yml down --remove-orphans
sudo docker network prune
sudo docker network rm  $( sudo docker network ls | awk '{print $2}')
sudo rm -rf ./volumes/dbdata/
sudo rm -rf ./volumes/metrics/
sudo docker-compose -f chirpstack-compose.yml up -d
sleep 1
sudo docker-compose -f core-compose.yml up -d
sleep 1
./subscribers-ue.sh
sleep 1
sudo docker-compose -f iotsdgw-compose.yml up -d
sleep 1
sudo docker-compose -f iotsdgw-compose.yml exec my5gcore-ue sh

