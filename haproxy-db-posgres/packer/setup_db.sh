#!/bin/bash

# Update package lists and install necessary packages
sudo apt-get update && sudo apt-get install -y vim wget

# Add PostgreSQL APT repository
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import PostgreSQL signing key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update package lists again
sudo apt-get update

# Install the latest version of PostgreSQL server and client
sudo apt-get install -y postgresql postgresql-client
