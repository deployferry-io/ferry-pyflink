FROM flink:1.19.1-java17

# Install Python 3, pip3, JDK, and development packages
RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-dev openjdk-17-jdk jq && \
    rm -rf /var/lib/apt/lists/*

# Create a symlink for python
RUN ln -s /usr/bin/python3 /usr/bin/python

# Detect architecture and set JAVA_HOME accordingly
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "aarch64" ]; then \
        export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-arm64; \
    elif [ "$ARCH" = "x86_64" ]; then \
        export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64; \
    else \
        echo "Unsupported architecture: $ARCH" && exit 1; \
    fi && \
    echo "JAVA_HOME=$JAVA_HOME" >> /etc/environment

# Install Apache Flink Python package
RUN pip3 install --no-cache-dir apache-flink==1.19.1
