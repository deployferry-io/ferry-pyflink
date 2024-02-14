FROM flink:1.17.2-java11

# Install Python 3, pip3, JDK, and development packages
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-dev openjdk-11-jdk jq && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip3 install --no-cache-dir apache-flink==1.17.2
