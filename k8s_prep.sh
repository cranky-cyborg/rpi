#/bin/bash

dphys-swapfile swapoff
dphys-swapfile uninstall
update-rc.d dphys-swapfile remove
systemctl disable dphys-swapfile.service
apt-get remove dphys-swapfile dc

echo "Turned SwapOff"

#------------------------
echo "Setting up WiFi"

read -p "Wifi SSID: " wifiSSID
read -s "Wifi Passphrase:" wifiPassphrase

read -p "Wifi Country code (e.g. US, GB, NZ..):" wifiCountry

echo "country="$wifiCountry >> /etc/wpa_supplicant/wpa_supplicant.conf
echo " " >> /etc/wpa_supplicant/wpa_supplicant.conf
wpa_passphrase $wifiSSID $wifiPassphrase >> /etc/wpa_supplicant/wpa_supplicant.conf

#------------------------
echo " "
echo "Change your password, RaspberryPi default password is 'raspberry'."
passwd -q
echo " "

echo "Hope that went well!, Now lets change the host name."
echo "As this machine will become a node (or master) of kubernetes"
echo "it is recommeded that you follow a pattern, something like 'node-001'"
echo "This will ensure, your machine naming is consistent and easy to identify".
echo " "
read -p "New Hostname: " newHostName

hostnamectl set-hostname $newHostName

hostnamectl
#------------------------


