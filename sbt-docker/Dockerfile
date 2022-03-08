FROM eclipse-temurin:17.0.2_8-jre-alpine

ENV SBT_VERSION 1.6.2
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN \
  apk add --no-cache --virtual=.build-dependencies curl bc ca-certificates && \
  apk add --no-cache bash && \
  cd /tmp && \
  curl -fsL https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz | tar xfz - -C /usr/local && \
  curl -fsL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub > /etc/apk/keys/sgerrand.rsa.pub && \
  curl -fsL https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk > glibc-2.29-r0.apk && \
  apk add glibc-2.29-r0.apk && \
  apk del .build-dependencies && \
  rm -rf /tmp/*

RUN apk add --no-cache docker git
