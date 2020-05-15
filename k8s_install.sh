/bin/bash


### Pre-requisites
### using 'raspi-config'
###  - Change Password
###  - Chnage Hostname [to something like node-001, and make sure the numbering is unique]
###  - Connect to network (Wifi/Ethernet)
###  - Chnage Local (Language, Keyboard, timezone) to what suits you
###  - Enable SSH network interface
### 

### Disable & remove swap
dphys-swapfile swapoff
dphys-swapfile uninstall
update-rc.d dphys-swapfile remove
systemctl disable dphys-swapfile.service
apt-get remove dphys-swapfile dc

### Install and setup Firewall
apt-get install ufw -y

ufw allow 6443
ufw allow 2379
ufw allow 10250:10252/tcp
ufw allow 30000:32767/tcp

ufw enable

### letting iptable see bridge traffic

sudo modprobe br_netfilter

sudo cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system


### install docker

sudo curl -sSL https://get.docker.com | sh && sudo usermod -aG docker pi

### setting up cgroupdriver  & other cgroup settings
cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2"
}
EOF

cp /boot/cmdline.txt /boot/cmdline_bkup.txt

orig="$(head -n1 /boot/cmdline.txt) cgroup_enable=cpuset cgroup_enable=memory cgroup_driver=systemd"

echo $orig | tee /boot/cmdline.txt

cat /boot/cmdline.txt

### setting up apt-get for k8s, because we need that

apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF | tee /etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

### now install kubelet, kubeadm and kubectl
apt-get update
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

### post requirement
### run "kubeadm init" for master, or join to anther node.



