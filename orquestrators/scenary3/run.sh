#!/bin/bash

sudo docker-compose -f core-compose.yml down --remove-orphans
sudo docker network prune
sudo rm -rf ./volumes/dbdata/
sudo docker-compose -f chirpstack-compose1.yml up -d
sleep 1
sudo docker-compose -f chirpstack-compose2.yml up -d
sleep 1
sudo docker-compose -f core-compose.yml up -d
sleep 1
./subscribers-ue.sh
sleep 1
sudo docker-compose -f iotsdgw-compose.yml up -d

