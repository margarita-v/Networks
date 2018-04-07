#!/bin/bash

A_IP=192.168.0.1/24
B_IP=192.168.1.1/24

sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP

sudo iptables -A INPUT -i lo -j ACCEPT
sudo iptables -A OUTPUT -o lo -j ACCEPT

sudo iptables -A INPUT -p icmp -j ACCEPT
sudo iptables -A FORWARD -p icmp -j ACCEPT
sudo iptables -A OUTPUT -p icmp -j ACCEPT

sudo iptables -A FORWARD -d $A_IP -p tcp --sport 8080 -j ACCEPT
sudo iptables -A FORWARD -d $B_IP -p tcp --dport 8080 -j ACCEPT
