#/bin/bash
sudo apt autoremove -y
sudo apt-get clean -y
sudo apt clean -y

# delete unused kernel module folder
sudo rm -rf /usr/share/doc/
sudo rm -rf /usr/share/man/
sudo rm -rf /usr/share/locale/
sudo rm -rf /etc/sgml/