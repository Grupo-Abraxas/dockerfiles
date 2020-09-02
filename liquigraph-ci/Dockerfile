FROM adoptopenjdk/openjdk11:jre-11.0.7_10-alpine
ARG LIQUIGRAPH_VERSION=4.0.2

ENV CHANGELOG="changelog.xml"
ENV NEO4J_JDBC_URL="jdbc:neo4j:neo4j://localhost:7687/"
ENV NEO4J_USER="neo4j"
ENV NEO4J_PASSWORD=""
ENV WAIT_FOR_URL="localhost:7474"
ENV WAIT_RETRIES=60
ENV WAIT_BETWEEN=1

WORKDIR /usr
RUN apk update && \
  apk upgrade && \
  apk --no-cache add \
  ca-certificates \
  openssl \
  libc-dev && \
  wget https://repo1.maven.org/maven2/org/liquigraph/liquigraph-cli/${LIQUIGRAPH_VERSION}/liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz.md5 && \
  wget https://repo1.maven.org/maven2/org/liquigraph/liquigraph-cli/${LIQUIGRAPH_VERSION}/liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz && \
  md5sum liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz | cut -d " " -f1 > sum && \
  diff -w sum liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz.md5 && \
  tar xzf liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz && \
  rm liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz

ENV PATH=$PATH:/usr/liquigraph-cli

ADD ./wait.sh ./wait.sh

WORKDIR /
ENTRYPOINT /usr/wait.sh "$WAIT_FOR_URL" $WAIT_RETRIES $WAIT_BETWEEN \
           liquigraph.sh                    \
           --changelog    "$CHANGELOG"      \
           --graph-db-uri "$NEO4J_JDBC_URL" \
           --username     "$NEO4J_USER"     \
           --password     "$NEO4J_PASSWORD"
