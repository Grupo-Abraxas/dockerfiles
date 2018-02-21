ARG VERSION=v0.21.1
FROM certbot/certbot:${VERSION}

MAINTAINER rrodriguez@grupoabraxas.com

RUN apk add --no-cache curl

COPY run.sh /certbot/run.sh

EXPOSE 80

ENTRYPOINT [ "sh", "-f", "/certbot/run.sh"]
