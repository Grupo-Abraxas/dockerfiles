FROM python:3.7-alpine

MAINTAINER Mauro Gonzalez <mgonzalez@grupoabraxas.com>

RUN apk update && \
apk add --no-cache --purge bash curl gcc libffi-dev musl-dev openssl-dev && \
pip install --user --upgrade pip && \
pip install ansible && \
rm -rf /tmp/* && \
rm -rf /var/cache/apk/*
