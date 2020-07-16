# Debian 10 Buster - Unbound Filter using https://energized.pro/

# install unbound DNS
apt install unbound python-unbound ca-certificates dnsutils

# create zones directory
mkdir -p /etc/unbound/zones

# crontab schedule
update root.hints
- @weekly /usr/local/bin/update_named.sh

update ads/rpz blocking list
- @weekly /usr/local/bin/ads-block.sh

# Installing IPTables-persistent and IPSet-persistent
apt install iptables-persistent ipset-persistent curl

# Move to IPTables-Legacy
- update-alternatives --set iptables /usr/sbin/iptables-legacy
- update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

# Download CSF Firewall
- cd /opt/ 
- wget http://download.configserver.com/csf.tgz 
- tar xzf csf.tgz 

# Installing CSF
- cd /opt/csf 
- sh install.sh 

# Test CSF fuction
> perl /usr/local/csf/bin/csftest.pl
