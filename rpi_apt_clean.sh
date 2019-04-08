#/bin/bash
sudo apt autoremove -y
sudo apt-get clean -y
sudo apt clean -y

# delete unused kernel module folder
sudo rm -rf /var/cache/man/
sudo rm -rf /usr/share/doc/
sudo rm -rf /usr/share/man/
sudo rm -rf /usr/share/locale/
sudo rm -rf /etc/sgml/
#make sure to do an upgrade to 4.19 using rpi-upgrade, or else you just bricked.
sudo rm -rf /lib/modules/4.14.79-v7+/
sudo rm -rf /lib/modules/4.14.*
sudo rm -rf /lib/modules/4.19.32+
sudo rm -rf /boot.bak
sudo rm -rf /var/lib/apt/lists
sudo rm -r  /var/log/*
sudo rm -r  /var/backups/*
sudo rm -r  /var/tmp/*
sudo rm -r  /var/caches/*
sudo rm -r  /tmp/*
sudo rm -r  /run/log/*
sudo rm -rf /lib/modules.bak

#removing swap file
#sudo swapoff /var/swap
#sudo rm /var/swap


#must create a swap file on restoring the image.
#sudo fallocate -l 250M /var/swap
#sudo chmod 600 /var/swap
#sudo dd if=/dev/zero of=/var/swap bs=1024 count=1048
#sudo mkswap /var/swap
#sudo swapon /var/swap
