#!/bin/sh
# To forward boot2docker VM ports to localhost on MacOSX
# Need to be run once only and with boot2docker VM stopped

set -e

# Memcached 11211
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port11211,tcp,,11211,,11211"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port11211,udp,,11211,,11211"

# Redis 6379
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port6379,tcp,,6379,,6379"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port6379,udp,,6379,,6379"

# MongoDB 27017
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port27017,tcp,,27017,,27017"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port27017,udp,,27017,,27017"

# MySQL 3306
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port3306,tcp,,3306,,3306"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port3306,udp,,3306,,3306"

# PostgreSQL 5432
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port5432,tcp,,5432,,5432"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port5432,udp,,5432,,5432"

# Riak 8087
VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port8087,tcp,,8087,,8087"
VBoxManage modifyvm "boot2docker-vm" --natpf1 "udp-port8087,udp,,8087,,8087"
