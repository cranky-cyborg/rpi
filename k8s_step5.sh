#/bin/bash

sudo cp /boot/cmdline.txt /boot/cmdline_bkup.txt

sudo orig="$(head -n1 /boot/cmdline.txt) cgroup_enable=cpuset cgroup_enable=memory"

echo $orig | tee /boot/cmdline.txt

cat /boot/cmdline.txt

echo "cgroup enablement complete!"
