#!/bin/bash
clear

if [ "${EUID}" -ne 0 ]; then
	echo "You need to run this script as root"; exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
	echo "OpenVZ is not supported"; exit 1
fi
if [ -f "/etc/v2ray/domain" ]; then
	echo "Script Already Installed"; exit 0
fi

SCRIPT_DIR=$( cd $(dirname "${BASH_SOURCE[0]}") && pwd )
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf

bash $SCRIPT_DIR/scripts/cf.sh

screen -S sshvpn bash $SCRIPT_DIR/scripts/sshvpn.sh
screen -S weleh bash $SCRIPT_DIR/scripts/weleh.sh
screen -S ssr bash $SCRIPT_DIR/scripts/ssr.sh
screen -S ss bash $SCRIPT_DIR/scripts/sodosok.sh
screen -S wg bash $SCRIPT_DIR/scripts/wg.sh
screen -S v2ray bash $SCRIPT_DIR/scripts/v2ray.sh

bash $SCRIPT_DIR/scripts/set-br.sh

rm -f /root/ssh-vpn.sh
rm -f /root/weleh.sh
rm -f /root/wg.sh
rm -f /root/ss.sh
rm -f /root/ssr.sh
rm -f /root/ins-vt.sh
rm -f /root/set-br.sh
rm -f /root/ins-trojango.sh

cat << EOF > /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://joekersvpn.com

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/anisakansa/project1/main/set.sh"
chmod +x /etc/set.sh
echo " "
echo "Installation has been completed!!"
echo " "
echo "================ SCRIPT LOGGER ================" | tee -a log-install.txt
echo "Service & Port" | tee -a log-install.txt
echo "  OpenSSH : 22" | tee -a log-install.txt
echo "  Dropbear : 109, 143" | tee -a log-install.txt
echo "  OpenVPN : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "  Stunnel : 222, 777" | tee -a log-install.txt
echo "  Squid : 3128, 8080" | tee -a log-install.txt
echo "  Badvpn : 7100, 7200, 7300" | tee -a log-install.txt
echo "  SS-OBFS TLS : 2443-2543" | tee -a log-install.txt
echo "  SS-OBFS HTTP : 3443-3543" | tee -a log-install.txt
echo "  Shadowsocks-R : 1443-1543" | tee -a log-install.txt
echo "  Vmess TLS : 8443" | tee -a log-install.txt
echo "  Vmess None TLS : 80" | tee -a log-install.txt
echo "  Vless TLS : 2083" | tee -a log-install.txt
echo "  Vless None TLS : 8880" | tee -a log-install.txt
echo "  Trojan : 2087" | tee -a log-install.txt
echo "  Wireguard : 7070" | tee -a log-install.txt
echo "  Nginx : 81" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "Server Information & Other Features" | tee -a log-install.txt
echo "	Timezone : Kuala_Lumpur (GMT 0800)" | tee -a log-install.txt
echo "	Fail2Ban : [ON]" | tee -a log-install.txt
echo "	DDoS Deflate : [ON]" | tee -a log-install.txt
echo "	IPtables : [ON]" | tee -a log-install.txt
echo "	Auto-Reboot : [ON]" | tee -a log-install.txt
echo "	IPv6 : [OFF]" | tee -a log-install.txt
echo "	Autoreboot On 05.00" | tee -a log-install.txt
echo "	Autobackup Data" | tee -a log-install.txt
echo "	Restore Data" | tee -a log-install.txt
echo "	Auto Delete Expired Account" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "==================================================================" | tee -a log-install.txt
echo ""
reboot
