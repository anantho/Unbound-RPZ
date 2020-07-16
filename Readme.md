# Debian 10 Buster - Unbound Filter using https://energized.pro/

# install unbound DNS
apt install unbound python-unbound ca-certificates dnsutils

# create zones directory
mkdir -p /etc/unbound/zones

# crontab schedule
@weekly /usr/local/bin/update_named.sh #update root.hints

@weekly /usr/local/bin/ads-block.sh #update ads/rpz blocking list
