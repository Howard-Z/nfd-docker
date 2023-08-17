ARG VARIANT="jammy"
FROM buildpack-deps:${VARIANT}-curl

ENV DEBIAN_FRONTEND=noninteractive

LABEL dev.containers.features="common"

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
    build-essential \
    sudo \
    git \
    pkg-config \
    python3-minimal \
    python3-pip \
    libboost-all-dev \
    libssl-dev \
    libsqlite3-dev \
    libpcap-dev \
    g++ \
    gcc && \
    #note ^ this && must be present
    apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install ndn things

RUN git clone --depth=1 --recursive --branch ndn-cxx-0.8.1 https://github.com/named-data/ndn-cxx.git && \
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
    cd .. && \
    rm -rf NFD && \
    git clone https://github.com/Howard-Z/nfd-dev-docker.git && \
    cd nfd-dev-docker && \
    cd confs && \
    cp client.conf /usr/local/etc/ndn/client.conf && \
    cp nfd.conf /usr/local/etc/ndn/nfd.conf && \
    cd .. && \
    cd .. && \
    rm -rf nfd-dev-docker


