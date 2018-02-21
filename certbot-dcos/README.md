# CERTBOT-DCOS

Use letsencrypt to encrypt your Marathon-lb endpoints!

## Requirements

Clone this repo and modify the marathon.json file to include:

- The list of hostnames (must be FQDNs) for which you want to generate SSL certs (in `HAPROXY_0_VHOST`)
- An admin email address for your certificate (in `CERTBOT_EMAIL`)
- The marathon API endpoint (in `MARATHON_URL`)
- The marathon-lb app Id (in `MARATHON_LB_ID`)
- Share the path `/etc/letsencrypt` from this app with the marathon-lb app.
- Set the `--ssl-certs` option to `/etc/letsencrypt/live` on marathon-lb.
