# Dockerfile to create image with cron services
FROM alpine:latest

# Configure
RUN apk add --no-cache curl
RUN apk add --no-cache jq

# Cronjob
RUN echo '*/5 * * * * /bin/ash /srv/dyndns.sh > /proc/$(cat /var/run/crond.pid)/fd/1 2>&1' >> /root/crontab.conf
ADD https://github.com/FarrowStrange/hetzner-api-dyndns/releases/latest/download/dyndns.sh /srv/dyndns.sh

# Add the cron job
RUN crontab /root/crontab.conf

# Run the command on container startup
CMD [ "/usr/sbin/crond", "-f", "-d8" ]
