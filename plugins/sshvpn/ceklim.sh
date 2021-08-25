#!/bin/bash
clear

MYIP=$(wget -qO- ifconfig.me/ip);

echo "-------------------------------------"
if [ -e "/root/log-limit.txt" ]; then
  echo "User Who Violate The Maximum Limit";
  echo "Time - Username - Number of Multilogin"
  echo "-------------------------------------";
  cat /root/log-limit.txt
else
  echo " No user has committed a violation"
  echo " or"
  echo " The user-limit script not been executed."
fi
echo "-------------------------------------"
