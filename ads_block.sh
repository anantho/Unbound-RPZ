#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
rm /tmp/hosts*
rm /tmp/ads.conf*
wget -O /tmp/hosts https://block.energized.pro/ultimate/formats/hosts.txt
echo "server:" > /tmp/ads.conf
cat /tmp/hosts | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" always_nxdomain"}' >> /tmp/ads.conf
cp /tmp/ads.conf /etc/unbound/zones/energized-ultimate.conf
systemctl restart unbound
