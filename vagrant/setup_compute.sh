#!/usr/bin/env bash
set -ex

cd devstack
cp /vagrant/compute.conf local.conf
host=$(hostname)
ip=$(ifconfig | grep 192.168.0 | cut -f2 -d: | cut -f1 -d' ')
sed -i -e "s/HOSTIP/$ip/" -e "s/HOSTNAME/$host/" local.conf
./stack.sh

sudo pvcreate /dev/vdb
sudo vgextend stack-volumes-lvmdriver-1 /dev/vdb
