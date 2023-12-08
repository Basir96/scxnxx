#!/bin/bash
BGreen='\e[1;32m'
NC='\e[0m'
cd
acc

echo "\e[1;32m Proses Download Script Slowdns.. \e[0m"
wget https://raw.githubusercontent.com/basir96/scxnxx/main/udp-custom/slowdns/slowdns.sh && chmod +x slowdns.sh && ./slowdns.sh
# sleep 1
# echo "\e[1;32m Proses Download Script OpenVPN.. \e[0m"
# wget https://raw.githubusercontent.com/basir96/scxnxx/main/udp-custom/openvpn/openvpn.sh && chmod +x openvpn.sh && ./openvpn.sh
sleep 1
# chmod +x /usr/bin/usernew
# chmod +x /usr/bin/trial
rm -rf /root/udp
mkdir -p /root/udp
# install udp-custom
echo ""
sleep 1
clear
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://github.com/Afdhan/scp/raw/main/udp-custom/udp-custom-linux-amd64" -O /root/udp/udp-custom && rm -rf /tmp/cookies.txt
chmod +x /root/udp/udp-custom
clear
# install Config Default Udp
echo ""
sleep 1
clear
wget -q --show-progress --load-cookies /tmp/cookies.txt "https://github.com/Afdhan/scp/raw/main/udp-custom/config.json" -O /root/udp/config.json && rm -rf /tmp/cookies.txt
chmod 644 /root/udp/config.json

if [ -z "$1" ]; then
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
else
cat <<EOF > /etc/systemd/system/udp-custom.service
[Unit]
Description=UDP Custom

[Service]
User=root
Type=simple
ExecStart=/root/udp/udp-custom server -exclude $1
WorkingDirectory=/root/udp/
Restart=always
RestartSec=2s

[Install]
WantedBy=default.target
EOF
fi

echo start service udp-custom
systemctl start udp-custom &>/dev/null

echo enable service udp-custom
systemctl enable udp-custom &>/dev/null

echo ""
sleep 0,5
clear
cd
rm -rf udp.sh
rm -rf slowdns.sh

