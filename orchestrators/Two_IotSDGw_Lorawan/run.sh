#!/bin/bash

sudo docker-compose -f core-compose.yml down --remove-orphans
sudo docker network prune -f
sudo rm -rf ./volumes/dbdata/
sudo rm -rf ./volumes/metrics1/
sudo rm -rf ./volumes/metrics2/


sudo docker-compose -f chirpstack-compose1.yml up -d
sleep 1
sudo docker-compose -f chirpstack-compose2.yml up -d
sleep 1
sudo docker-compose -f core-compose2.yml up -d
sleep 1 
#../../bin/subscribers-update.sh

./subscribers-ue.sh
#./subscribers2-ue.sh
sleep 1

sudo docker-compose -f iotsdgw-compose.yml up -d
