#!/bin/sh
# Update S.O.
sudo apt -y update
sudo apt -y install git gcc g++ cmake autoconf libtool pkg-config libmnl-dev libyaml-dev

# Clone repository
git clone https://github.com/free5gc/gtp5g.git

# Build GTP
cd gtp5g
make
sudo make install
