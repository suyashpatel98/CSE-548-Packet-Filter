#!/bin/bash
sudo iptables -F
sudo iptables -X
sudo iptables -t nat -F
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT

