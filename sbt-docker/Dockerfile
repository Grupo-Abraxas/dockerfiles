FROM openjdk:8u212-jre-alpine

ENV SBT_VERSION 1.2.8
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

RUN \
  apk add --no-cache --virtual=.build-dependencies curl bc ca-certificates && \
  apk add --no-cache bash && \
  cd /tmp && \
  curl -fsL https://piccolo.link/sbt-$SBT_VERSION.tgz | tar xfz - -C /usr/local && \
  apk del .build-dependencies && \
  rm -rf /tmp/*

RUN apk add --no-cache docker
