FROM eclipse-temurin:19.0.1_10-jre-alpine

RUN apk add --no-cache docker git bash

ADD https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub /etc/apk/keys/sgerrand.rsa.pub
ADD https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk /tmp/glibc-2.29-r0.apk

RUN apk add --force-overwrite /tmp/glibc-2.29-r0.apk
RUN apk fix --force-overwrite alpine-baselayout-data
RUN rm -rf /tmp/*

ENV SBT_VERSION 1.8.2
ENV SBT_HOME /usr/local/sbt
ENV PATH ${PATH}:${SBT_HOME}/bin

ADD https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz /tmp/sbt.tgz
RUN tar xfz /tmp/sbt.tgz --directory=/usr/local
RUN rm -rf /tmp/*
