#/bin/bash

apt-get install ufw

ufw allow 6443
ufw allow 2379
ufw allow 10250:10252/tcp
ufw allow 30000:32767/tcp

ufw enable

echo "Firewall Setup!"
