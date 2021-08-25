#!/bin/bash
clear

MYIP=$(wget -qO- ifconfig.me/ip);
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf