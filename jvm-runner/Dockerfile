FROM eclipse-temurin:19.0.1_10-jre-alpine

RUN apk upgrade --no-cache --available && apk add --no-cache openssl

RUN echo | openssl s_client -servername www.arkondata.com -connect www.arkondata.com:443| sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/ssl/certs/arkon.crt && \
  keytool -delete -noprompt -alias arkondata -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit || true &&\
  keytool -importcert -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -file /etc/ssl/certs/arkon.crt -alias "arkondata" -noprompt
