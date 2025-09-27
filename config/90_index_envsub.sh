#!/bin/sh
set -e

# Perform environment variable substitution in the mounted index.html
sed -e "s|\${DOMAIN}|${URL}|g" \
    /config/www/index.html.template > /config/www/index.html
