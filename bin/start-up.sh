#!/bin/bash 

sleep 3
./initial_registration.sh 
./main -ipv4 127.0.0.1   -port 1700 &
./simulator
