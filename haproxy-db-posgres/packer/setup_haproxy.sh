#!/bin/bash

set -e
set -o pipefail

# Update package lists and install necessary packages
sudo apt-get update
sudo apt-get install -y vim software-properties-common

# Add HAProxy APT repository and update package lists
sudo add-apt-repository -y ppa:vbernat/haproxy-2.6
sudo apt-get update

# Install HAProxy
sudo apt-get install -y haproxy
