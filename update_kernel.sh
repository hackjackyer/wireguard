!#/bin/bash
yum -y install epel-release curl
sed -i "0,/enabled=0/s//enabled=1/" /etc/yum.repos.d/epel.repo
yum remove -y kernel-devel
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
yum install https://www.elrepo.org/elrepo-release-7.0-4.el7.elrepo.noarch.rpm
yum --disablerepo="*" --enablerepo="elrepo-kernel" list available
yum -y --enablerepo=elrepo-kernel install kernel-ml
sed -i "s/GRUB_DEFAULT=saved/GRUB_DEFAULT=0/" /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg
wget https://elrepo.org/linux/kernel/el7/x86_64/RPMS/kernel-ml-devel-5.2.4-1.el7.elrepo.x86_64.rpm
rpm -ivh kernel-ml-devel-5.2.4-1.el7.elrepo.x86_64.rpm
yum -y --enablerepo=elrepo-kernel install kernel-ml-devel
clear
echo 请重启服务器，应用新内核！
