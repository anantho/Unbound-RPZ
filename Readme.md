Debian 10 Buster - Unbound RPZ

# install unbound DNS
apt install unbound python-unbound

# create zones directory
mkdir -p /etc/unbound/zones

# create file rpz.conf and adblock.local
printf "#Settings for nxdomain zones\n\ninclude: /etc/unbound/zones/adblock.local\t# My own additions\n\ninclude: /etc/unbound/zones/rpz.db\t# The sum of all imported zones\n" > /etc/unbound/unbound.conf.d/rpz.conf
printf "# My personal additions\n" > /etc/unbound/zones/adblock.local
