#!/bin/bash

### Instalação do Docker utilizando repositório https://github.com/eliezershell/docker.git
git clone https://github.com/eliezershell/docker.git
chmod +x ./docker/instalador_docker.sh; ./docker/instalador_docker.sh

### Instalação do Jenkins
#criando rede docker
docker network create jenkins

# Caso queira instalar container 'docker in docker' remover os comentarios do comando abaixo:
#docker run --name jenkins-docker-dind --rm --detach \
#  --privileged --network jenkins --network-alias docker \
#  --env DOCKER_TLS_CERTDIR=/certs \
#  --volume jenkins-docker-certs:/certs/client \
#  --volume jenkins-data:/var/jenkins_home \
#  --publish 2376:2376 \
#  docker:dind --storage-driver overlay2

#COntruindo e instalando container Jenkins blue ocean
docker build -t myjenkins-blueocean:2.479.2-1 .

docker run --name jenkins-blueocean --restart=on-failure --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  --volume web-content:/mnt/web-content \
  myjenkins-blueocean:2.479.2-1

  #Instalando imagem nginx
docker run --name some-nginx -detach \
  --publish 80:80 \
  --volume web-content:/usr/share/nginx/html \
  nginx
  
