FROM gcr.io/spark-operator/spark-py:v3.1.1-hadoop3
USER root
# Update python version
RUN apt update --allow-releaseinfo-change -y
ADD https://www.python.org/ftp/python/3.10.10/Python-3.10.10.tgz Python-3.10.10.tgz
RUN tar -xzvf Python-3.10.10.tgz
RUN apt install -y build-essential libbz2-dev zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libsqlite3-dev libffi-dev unzip
RUN cd Python-3.10.10/ && ./configure --enable-optimizations && make altinstall && cd ..
RUN update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.10 1
RUN rm Python-3.10.10.tgz
RUN rm -rf Python-3.10.10/
USER ${spark_uid}

ENTRYPOINT ["python3"]
