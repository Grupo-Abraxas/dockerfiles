#!/bin/bash
set -e

sleep 15

while [ true ];do
  for i in $(echo $MARATHON_APP_LABEL_HAPROXY_0_VHOST | sed "s/,/ /g")
  do
    echo "Request certs for domain: $i"
    certbot --no-self-upgrade certonly \
      --standalone --preferred-challenges http \
      -d $i --email $CERTBOT_EMAIL --agree-tos \
      --noninteractive --no-redirect \
      --rsa-key-size 4096 --expand

    echo "Chain keys for domain: $i"
    cat /etc/letsencrypt/live/$i/fullchain.pem \
      /etc/letsencrypt/live/$i/privkey.pem > \
      /etc/letsencrypt/live/$i.pem
  done

  echo "Restart marathon-lb"
  curl -X POST -H "Content-Type: application/json" -d '{"force":false}' ${MARATHON_URL}/v2/apps/${MARATHON_LB_ID}/restart
  sleep 24h
done
