#/bin/bash
#make sure you run the below (until reboot) before running this script
#sudo apt-get update -y
#sudo apt-get upgrade -y
#sudo rpi-update
#reboot

sudo apt purge apt-utils manpages python* ssh* openssh* vim-tiny vim-common ed xxd info install-info dc dos* cifs-utils libx11-data -y
sudo apt purge v4l-utils xml-core libpython3* debconf-i18n xz-utils bzip* unzip* tasksel rsyslog logrotate libpam-chksshpwd debconf-utils -y
sudo apt purge linux-libc-dev libmnl-dev* libraspberrypi-dev* libraspberrypi-doc -y
sudo apt purge gcc-4.6* gcc-4.7* gcc-4.8* gcc-4.9* gcc-5* tzdata -y

sudo apt purge perl groff-base man-db cpp cpp-6  -y

sudo apt purge geoip-database libnss-mdns luajit shared-mime-info libtext-charwidth-perl libtext-iconv-perl -y

#beloe are nice to have packages

sudo apt purge aptitude* -y 

# from below removed some questionable packages
#sudo apt purge libicu* -y
