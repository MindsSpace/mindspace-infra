#!/bin/bash
set -ex
set -o pipefail

# stop postgresql server
sudo systemctl stop postgresql

# move the main folder to old folder
sudo mv /var/lib/postgresql/14/main /var/lib/postgresql/14/main_old

# copy backup from master server
sudo -u postgres pg_basebackup -h  10.184.0.22 -D /var/lib/postgresql/14/main -U replica -v --xlog-method=stream

# remove default conf files
sudo rm /etc/postgresql/14/main/pg_hba.conf
sudo rm /etc/postgresql/14/main/postgresql.conf

# copy new config files
sudo cp ./pg_hba.conf /etc/postgresql/14/main/pg_hba.conf
sudo cp ./postgresql.conf /etc/postgresql/14/main/postgresql.conf

# copy recovery file to main folder
sudo cp ./recovery.conf /var/lib/postgresql/14/main/recovery.conf
sudo chown postgres.postgres /var/lib/postgresql/14/main/recovery.conf


# start slave server
sudo systemctl start postgresql
