#/bin/bash
#make sure you run the below (until reboot) before running this script
#sudo apt-get update -y
#sudo apt-get upgrade -y
#sudo rpi-update
#reboot

sudo apt purge apt-utils manpages python* vim-tiny vim-common ed xxd info install-info dc dos* cifs-utils libx11-data \
               v4l-utils xml-core libpython3* debconf-i18n xz-utils bzip* unzip* tasksel rsyslog logrotate libpam-chksshpwd \
               debconf-utils linux-libc-dev libmnl-dev* libraspberrypi-dev* libraspberrypi-doc \
               gcc-4.6* gcc-4.7* gcc-4.8* gcc-4.9* gcc-5* tzdata xkb-data console-setup* triggerhappy sgml-base \
               perl groff-base man-db cpp cpp-6 geoip-database libnss-mdns luajit shared-mime-info libtext-charwidth-perl \
               libtext-iconv-perl aptitude* -y


# from below removed some questionable packages
#sudo apt purge libicu* -y
