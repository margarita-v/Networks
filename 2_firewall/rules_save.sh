#!/bin/bash

sudo iptables-save | sudo tee /etc/iptables.rules
