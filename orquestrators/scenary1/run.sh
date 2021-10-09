#!/bin/bash
sudo docker-compose -f chirpstack-compose.yml down --remove-orphans
sudo docker network prune -f
sudo docker-compose -f chirpstack-compose.yml up -d
sleep 3
sudo docker-compose -f iotsdgw-compose.yml up -d
#./config-vSBrT2020/subscribers.sh

