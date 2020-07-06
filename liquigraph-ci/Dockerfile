FROM adoptopenjdk/openjdk11:jre-11.0.7_10-alpine
ARG LIQUIGRAPH_VERSION=4.0.2

ENV CHANGELOG="changelog.xml"
ENV NEO4J_JDBC_URL="jdbc:neo4j:neo4j://localhost:7687/"
ENV NEO4J_USER="neo4j"
ENV NEO4J_PASSWORD=""

WORKDIR /usr
RUN wget --no-check-certificate -q \
    https://repo1.maven.org/maven2/org/liquigraph/liquigraph-cli/${LIQUIGRAPH_VERSION}/liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz.md5
RUN wget --no-check-certificate -q \
    https://repo1.maven.org/maven2/org/liquigraph/liquigraph-cli/${LIQUIGRAPH_VERSION}/liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz
RUN md5sum liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz | cut -d " " -f1 > sum
RUN diff -w sum liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz.md5

RUN tar xzf liquigraph-cli-${LIQUIGRAPH_VERSION}-bin.tar.gz
ENV PATH=$PATH:/usr/liquigraph-cli

WORKDIR /
ENTRYPOINT liquigraph.sh                    \
           --changelog    "$CHANGELOG"      \
           --graph-db-uri "$NEO4J_JDBC_URL" \
           --username     "$NEO4J_USER"     \
           --password     "$NEO4J_PASSWORD"
