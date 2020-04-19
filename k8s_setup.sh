#/bin/bash

#Note: This script must be run with superuser previliges (sudo)

# This script performs various activities to setup Kubernetes
# Performs Pre-requisites
# - Turn Swapoff
# - Firewall 
# - Setup network bridge 
# - Install docker
# - setup cgroup set
# - add Kubernetes repo
# - install kubernetes

#prior the these, it help you with
# - reset password
# - reset hostname
# - setup WiFi
# - Change Locale
# - change Timezone
# - change keyboard
# - enable ssh interface
# - Expand filesystem
# - Memory Split to 32
echo " "
echo "Below you will be prompted to reset your password."
echo " RaspberryPi default password is 'raspberry'."
passwd -q
echo " "
echo "Hope that went well!, Now lets change the host name."
echo "As this machine will become a node (or master) of kubernetes"
echo "it is recommeded that you follow a pattern, something like 'node-001'"
echo "This will ensure, your machine naming is consistent and easy to identify".
echo " "
read -p "Now, what do you want to name this machine: " newHostName

hostnamectl set-hostname $newHostName

hostnamectl

