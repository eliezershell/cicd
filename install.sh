#!/bin/bash

### Instalação do Docker 
# Adicionando a chave GPG oficial do Docker
sudo apt update
sudo apt install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Adicionando o repositório do Docker no APT
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

# Instalando Docker e extensões necessárias
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Ativando o serviço para iniciar junto com o S.O.
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

### Instalação do Jenkins
#criando rede docker
sudo docker network create jenkins

# Caso queira instalar container 'docker in docker' remover os comentarios do comando abaixo:
#sudo docker run --name jenkins-docker-dind --rm --detach \
#  --privileged --network jenkins --network-alias docker \
#  --env DOCKER_TLS_CERTDIR=/certs \
#  --volume jenkins-docker-certs:/certs/client \
#  --volume jenkins-data:/var/jenkins_home \
#  --publish 2376:2376 \
#  docker:dind --storage-driver overlay2

#COntruindo e instalando container Jenkins blue ocean
sudo docker build -t myjenkins:2.479.2-1 .

sudo docker run --name jenkins --restart=on-failure --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --publish 8080:8080 --publish 50000:50000 \
  --volume jenkins-data:/var/jenkins_home \
  --volume jenkins-docker-certs:/certs/client:ro \
  --volume web-content:/mnt/web-content \
  myjenkins:2.479.2-1

  #Instalando imagem nginx
sudo docker run --name some-nginx --restart=on-failure --detach \
  --network jenkins \
  --publish 80:80 \
  --volume web-content:/usr/share/nginx/html \
  nginx

# Adicionando usuário padrão ao grupo docker
sudo usermod -aG docker $USER
newgrp docker
