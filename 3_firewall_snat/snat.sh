#!/bin/bash

# Name and IP of device which has an access to the Internet
PROVIDER_NAME=eth3
PROVIDER_IP=10.0.0.0

sudo iptables -t nat -A POSTROUTING -s 192.168.0.1/24 -o $PROVIDER_NAME -j SNAT --to-source $PROVIDER_IP

# Another solve
sudo iptables -t nat -A POSTROUTING -s 192.168.0.1/24 -o $PROVIDER_NAME -j MASQUERADE
