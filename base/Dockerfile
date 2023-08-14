ARG VARIANT="jammy"
FROM buildpack-deps:${VARIANT}-curl

ENV DEBIAN_FRONTEND=noninteractive

LABEL dev.containers.features="common"

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
    autoconf \
    build-essential \
    sudo \
    wget \
    curl \
    git-all \
    iproute2 \
    iputils-ping \
    net-tools \
    netcat \
    tcpdump \
    pkg-config \
    python3 \
    python3-dev \
    python3-pip \
    libboost-all-dev \
    libssl-dev \
    libsqlite3-dev \
    libpcap-dev \
    dpkg-dev \
    psmisc \
    g++ \
    gcc \
    gdb \
    libc6-dev && \
    apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install ndn things

RUN python3 -m pip install --upgrade setuptools && \
    python3 -m pip install python-ndn[dev,pyca] && \
    git clone --depth=1 --recursive --branch ndn-cxx-0.8.1 https://github.com/named-data/ndn-cxx.git && \
    cd ndn-cxx && \
    ./waf configure && \
    ./waf -j4 && \
    ./waf install && \
    ldconfig && \
    cd .. && \
    rm -rf ndn-cxx && \
    git clone --depth=1 --recursive --branch NFD-22.12 https://github.com/named-data/NFD.git && \
    cd NFD && \
    ./waf configure && \
    ./waf -j2 && \
    ./waf install && \
    mkdir -p /usr/local/etc/ndn && \
    cp /usr/local/etc/ndn/nfd.conf.sample /usr/local/etc/ndn/nfd.conf && \
    cd .. && \
    rm -rf NFD && \
    git clone --depth=1 --recursive --branch ndn-tools-22.12 https://github.com/named-data/ndn-tools.git && \
    cd ndn-tools && \
    ./waf configure && \
    ./waf -j2 && \
    ./waf install && \
    cd .. && \
    rm -rf ndn-tools && \
    git clone --depth=1 --recursive --branch main https://github.com/yoursunny/ndn6-tools.git && \
    cd ndn6-tools && \
    make && \
    make install && \
    cd .. && \
    rm -rf ndn6-tools && \
    ndnsec key-gen /develop | ndnsec cert-install -
