FROM adoptopenjdk/openjdk11:jre-11.0.7_10-alpine

ENV SBT_VERSION 1.3.8
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN \
  apk add --no-cache --virtual=.build-dependencies curl bc ca-certificates && \
  apk add --no-cache bash tar && \
  cd /tmp && \
  curl -fsL https://piccolo.link/sbt-$SBT_VERSION.tgz | tar xfz - -C /usr/local && \
  curl -fsL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub > /etc/apk/keys/sgerrand.rsa.pub && \
  curl -fsL https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk > glibc-2.29-r0.apk && \
  apk add glibc-2.29-r0.apk && \
  apk del .build-dependencies && \
  rm -rf /tmp/*

RUN apk add --no-cache docker
