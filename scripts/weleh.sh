#!/bin/bash

cp $SCRIPT_DIR/files/dropbear-ws.py /usr/local/bin/ws-dropbear
cp $SCRIPT_DIR/files/ws-stunnel.py /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel

cp $SCRIPT_DIR/files/service-wsdropbear /etc/systemd/system/ws-dropbear.service && chmod +x /etc/systemd/system/ws-dropbear.service
cp $SCRIPT_DIR/files/ws-stunnel.service /etc/syatemd/system/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service

systemctl daemon-reload

systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service
