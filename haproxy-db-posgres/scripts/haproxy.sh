#!/bin/bash
set -ex
set -o pipefail

# remove default config
sudo rm -v /etc/haproxy/haproxy.cfg
sudo apt-get install net-tools -y

# copy new config
sudo cp ./haproxy.cfg /etc/haproxy/haproxy.cfg

#start the server
sudo systemctl restart haproxy

