#!/bin/bash

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
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y

# Ativando o serviço para iniciar junto com o S.O.
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Adicionando usuário padrão ao grupo docker
sudo usermod -aG docker $USER
newgrp docker
