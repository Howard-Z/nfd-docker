# NFD-Dev-Docker
This is a docker container that installs and runs NFD.

## First time install
- In `base` execute `docker build --tag nfd-dev-docker .`

## Running the containers
- In the project folder, run `docker-compose up -d` to start docker container node1.
  - node1 has IP 192.168.10.225 
- Use `docker-compse exec node1 bash` to bash into the Docker

## Setting up the shared socket
In order to be able to share the NFD socket between the host and the docker container, the ndn-cxx client must be updated with the new socket path
```
git clone https://github.com/Howard-Z/nfd-dev-docker.git && \
cd nfd-dev-docker && \
cd confs && \
cp client.conf /usr/local/etc/ndn/client.conf && \
cd .. && \
cd .. && \
rm -rf nfd-dev-docker
```

## Cleaning up
- Use `docker-compose down -v --rmi all --remove-orphans` to shutdown the docker.

