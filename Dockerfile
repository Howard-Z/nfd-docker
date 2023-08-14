FROM nfd-dev-docker:latest

LABEL org.opencontainers.image.source "https://github.com/Howard-Z/nfd-dev-docker"
LABEL org.opencontainers.image.authors "Howard Zhu"
LABEL org.opencontainers.image.title "NFD Docker"
LABEL org.opencontainers.image.description \
    "General Docker for NFD with python-ndn and ndn-tools installed"


ENV DEBIAN_FRONTEND=noninteractive

