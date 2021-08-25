#!/bin/bash
clear

echo "======================================"
echo "[1] Restart All Services"
echo "[2] Restart OpenSSH"
echo "[3] Restart Dropbear"
echo "[4] Restart Stunnel4"
echo "[5] Restart OpenVPN"
echo "[6] Restart Squid"
echo "[7] Restart Nginx"
echo "[8] Restart Badvpn"
echo "[x] Exit"
echo "======================================"
read -p "Select From Options [1-8 or x]: " Restart

case $Restart in
  1)
    clear
    /etc/init.d/ssh restart
    /etc/init.d/dropbear restart
    /etc/init.d/stunnel4 restart
    /etc/init.d/openvpn restart
    /etc/init.d/fail2ban restart
    /etc/init.d/cron restart
    /etc/init.d/nginx restart
    /etc/init.d/squid restart
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 1000
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 1000
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 1000
    echo -e ""
    echo -e "======================================"
    echo -e ""
    echo -e "          Service/s Restarted         "
    echo -e ""
    echo -e "======================================"
    exit
  ;;
  2)
    clear
    /etc/init.d/ssh restart
    echo -e ""
    echo -e "======================================"
    echo -e ""
    echo -e "         SSH Service Restarted        "
    echo -e ""
    echo -e "======================================"
    exit
  ;;
  3)
    clear
    /etc/init.d/dropbear restart
    echo -e ""
    echo -e "======================================"
    echo -e ""
    echo -e "       Dropbear Service Restarted     "
    echo -e ""
    echo -e "======================================"
    exit
  ;;
  4)
    clear
    /etc/init.d/stunnel4 restart
    echo -e ""
    echo -e "======================================"
    echo -e ""
    echo -e "        Stunnel4 Service Restarted    "
    echo -e ""
    echo -e "======================================"
    exit
  ;;
  5)
    clear
    /etc/init.d/openvpn restart
    echo -e ""
    echo -e "======================================"
    echo -e ""
    echo -e "       OpenVPN Service Restarted      "
    echo -e ""
    echo -e "======================================"
    exit
  ;;
  6)
    clear
    /etc/init.d/squid restart
    echo -e ""
    echo -e "======================================"
    echo -e ""
    echo -e "        Squid3 Service Restarted      "
    echo -e ""
    echo -e "======================================"
    exit
  ;;
  7)
    clear
    /etc/init.d/nginx restart
    echo -e ""
    echo -e "======================================"
    echo -e ""
    echo -e "         Nginx Service Restarted      "
    echo -e ""
    echo -e "======================================"
    exit
  ;;
  8)
    clear
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7400 --max-clients 500
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7500 --max-clients 500
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7600 --max-clients 500
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7700 --max-clients 500
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7800 --max-clients 500
    screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7900 --max-clients 500
    echo -e ""
    echo -e "======================================"
    echo -e ""
    echo -e "    Badvpn  Badvpn Service Restarted  "
    echo -e ""
    echo -e "======================================"
    exit
  ;;
  x)
    clear
    exit
  ;;
esac