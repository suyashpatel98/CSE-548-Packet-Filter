#!bin/bash
sudo iptables -F
sudo iptables -t nat -F
sudo iptables -P INPUT DROP
sudo iptables -P OUTPUT DROP
sudo iptables -P FORWARD DROP

sudo iptables -A INPUT -p TCP --dport 80 -s 10.0.2.2 -d 10.0.2.3 -j ACCEPT
sudo iptables -A OUTPUT -p TCP --sport 80 -s 10.0.2.3 -d 10.0.2.2 -j ACCEPT



sudo iptables -t nat -A POSTROUTING -p icmp --icmp-type 8 -o enp0s8 -s 10.0.2.2 -j SNAT --to 10.0.1.5

sudo iptables -t nat -A PREROUTING -p icmp --icmp-type 0 -i enp0s8 -d 10.0.1.5 -j DNAT --to-destination 10.0.2.2


sudo iptables -A FORWARD -p icmp --icmp-type 8 -s 10.0.2.2 -d 8.8.8.8 -j ACCEPT
sudo iptables -A FORWARD -p icmp --icmp-type 0 -d 10.0.2.2 -j ACCEPT
