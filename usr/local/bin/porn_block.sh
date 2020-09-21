#!/usr/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
rm /tmp/porn*
wget -O /tmp/porn https://block.energized.pro/porn/formats/hosts
echo "server:" > /tmp/porn.conf
cat /tmp/porn | grep '^0\.0\.0\.0' | awk '{print "local-zone: \""$2"\" redirect\nlocal-data: \""$2" A 127.0.0.1\""}' >> /tmp/porn.conf
sed '/^local-zone: "0.0.0.0" redirect$/d' /tmp/porn.conf > /tmp/porn.conf.1
sed '/^local-data: "0.0.0.0 A 127.0.0.1"$/d' /tmp/porn.conf.1 > /tmp/porn.conf.2
sed -i '/^$/d' /tmp/porn.conf.2
cp /tmp/porn.conf.2 /etc/unbound/zones/energized-porn.conf
systemctl reload unbound
