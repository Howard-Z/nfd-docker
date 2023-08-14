# NFD-Dev-Docker
This is a development docker which contains 2 nodes. Node 1 contains a running instance of NFD, and node 2 is meant for development of an NFD application.

## First time install
- In `base` execute `docker build --tag nfd-dev-docker .`

## Running the containers
- In the project folder, run `docker-compose up -d` to start the two docker containers node1 and node2.
  - node1 has IP 192.168.10.225 and node2 has 192.168.10.230
- Use `docker-compose exec node2 bash` and `docker-compse exec node1 bash` to bash into the Docker
## Setting up the shared socket
Each node has their own unique script that is required to run simply replace node1 with node2 if setting up the other node
```
cd /project/scripts
./node1
```

## Cleaning up
- Use `docker-compose down -v --rmi all --remove-orphans` to shutdown the docker.

