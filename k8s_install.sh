/bin/bash


### Pre-requisites
### using 'raspi-config'
###  - Change Password
###  - Chnage Hostname [to something like node-001, and make sure the numbering is unique]
###  - Connect to network (Wifi/Ethernet)
###  - Chnage Local (Language, Keyboard, timezone) to what suits you
###  - Enable SSH network interface
### 


### Adding Kubernetes App store

# First ensuring all packages are up-to-date
sudo apt-get update
# Adding packages apt-transport-https, ca-certificates and curl
# Note: curl may-not be needed, but doesn't hurt
sudo apt-get install -y apt-transport-https ca-certificates curl

# Get the Google Signing Keys
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

# add the k8s repositories
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# finally install kubectl
sudo apt-get update
sudo apt-get install -y kubectl


