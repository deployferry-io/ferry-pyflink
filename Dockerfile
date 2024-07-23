FROM flink:1.19.1-java17

# Install Python 3, pip3, JDK, and development packages
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-dev openjdk-17-jdk jq && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python

ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-arm64

RUN pip3 install --no-cache-dir apache-flink==1.19.1
