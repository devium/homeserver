#!/bin/sh
set -e

# Perform environment variable substitution in the mounted index.html
sed -e "s|\${DOMAIN}|${URL}|g" /config/www/index.html.template > /config/www/index.html

# Perform in-place substitution of Hetzner credentials in dns-conf.
sed -i "s/^dns_hetzner_api_token.*/dns_hetzner_api_token = ${HETZNER_API_TOKEN}/" /config/dns-conf/hetzner.ini
