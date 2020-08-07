#!/usr/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
rm /tmp/hosts*
rm /tmp/ads.conf*
wget -O /tmp/hosts https://block.energized.pro/ultimate/formats/hosts.txt
echo "server:" > /tmp/ads.conf
cat /tmp/hosts | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" always_nxdomain"}' >> /tmp/ads.conf
sed -e 's/\<local-zone: "0.0.0.0" always_nxdomain\>//g' /tmp/ads.conf > /tmp/ads.conf.1
sed -i '/^$/d' /tmp/ads.conf.1
cp /tmp/ads.conf.1 /etc/unbound/zones/energized-ultimate.conf
systemctl restart unbound
