#!/bin/bash

sudo docker-compose -f chirpstack-compose.yml down --remove-orphans
sudo docker network prune
sudo docker-compose -f chirpstack-compose.yml up -d

#./config-vSBrT2020/subscribers.sh

