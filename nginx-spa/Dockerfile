ARG VERSION=1.27-alpine
FROM nginx:${VERSION}

LABEL MAINTAINER="rrodriguez@grupoabraxas.com"

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

RUN chown -R nginx:nginx /usr/share/nginx/html && chmod -R 755 /usr/share/nginx/html && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d && \
        chown -R nginx:nginx /etc/nginx/nginx.conf
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid

RUN sed -i 's/user  nginx;//g' /etc/nginx/nginx.conf
