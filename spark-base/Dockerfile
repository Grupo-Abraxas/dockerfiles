FROM gcr.io/spark-operator/spark-py:v3.1.1-hadoop3
USER root
# Update python version
RUN apt update --allow-releaseinfo-change -y
ADD https://www.python.org/ftp/python/3.11.1/Python-3.11.1.tgz Python-3.11.1.tgz
RUN tar -xzvf Python-3.11.1.tgz
RUN apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev
RUN cd Python-3.11.1/ && ./configure --enable-optimizations && make altinstall && cd ..
RUN update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.11 1
USER ${spark_uid}

ENTRYPOINT ["python3"]
