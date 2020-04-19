#/bin/bash

dphys-swapfile swapoff
dphys-swapfile uninstall
update-rc.d dphys-swapfile remove

echo "swap off"
