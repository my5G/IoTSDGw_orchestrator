#!/bin/sh

sudo apt -y update
sudo apt -y install git gcc g++ cmake autoconf libtool pkg-config libmnl-dev libyaml-dev

git clone https://github.com/free5gc/gtp5g.git
cd gtp5g
make
sudo make install