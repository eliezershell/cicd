# CI/CD
Instalação completa de um ambiente de CI/CD

## Instalação

Siga estas etapas para instalar o ambiente de CI/CD em seu servidor:

1. **Clone este repositório:**
   ```
   git clone https://github.com/eliezershell/cicd.git -b docker-compose
   ```
2. **Execute o script de instalação do Docker:**
   ```
   chmod +x ./cicd/install_docker.sh && ./cicd/install_docker.sh
   ```
3. **Execute o script de inicialização do Docker Compose:**
   ```
   cd cicd; sudo docker compose up -d
   ```
