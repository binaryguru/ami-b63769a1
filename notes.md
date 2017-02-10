rhel 7 amazon

# sudo su -
# yum update
# yum upgrade
# reboot

# sudo su -
X subscription-manager repos --enable=rhel-7-server-optional-rpms
X subscription-manager repos --enable=rhel-7-server-extras-rpms
# subscription-manager config --rhsm.manage_repos=0
X yum install yum-utils
# yum install nano
# yum install screen
# cp /etc/nanorc ~/.nanorc
# nano ~/.nanorc
  ? https://gist.github.com/ChrisWills/1337178
# yum clean all
# yum repolist enabled
X yum-config-manager --enable rhel-7-server-optional-rpms
X yum-config-manager --enable rhel-7-server-extras-rpms

*****************************************************************************
>> https://www.howtoforge.com/tutorial/how-to-install-openvpn-on-centos-7/

>> Enable the epel-repository
# yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

>> Install open vpn and easy-rsa and iptables
# yum install openvpn easy-rsa iptables-services

>> Configuring easy-rsa
# cp -r /usr/share/easy-rsa/ /etc/openvpn/
# cd /etc/openvpn/easy-rsa/2.*/
# nano vars
# source ./vars
# ./clean-all
# ./build-ca
# ./build-key-server server
# ./build-dh
# ./build-key client
# cd /etc/openvpn/easy-rsa/2.0/
# cp -r keys/ /etc/openvpn/

>> Configure OpenVPN
# cd /etc/openvpn
# nano server.conf
# mkdir -p /var/log/myvpn/
# touch /var/log/myvpn/openvpn.log

>> Disable firewalld and SELinux
X systemctl mask firewalld
X systemctl stop firewalld
# nano /etc/sysconfig/selinux
# reboot

>> Configure Routing and Iptables
# sudo su
# systemctl enable iptables
# systemctl start iptables
# iptables -F
# iptables -t nat -A POSTROUTING -s 192.168.200.024 -o eth0 -j MASQUERADE
# iptables-save > /etc/sysconfig/iptablesvpn
# nano /etc/sysctl.d/sysctl.conf
# systemctl start openvpn@server

>> Client Setup
