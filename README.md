## 📦 Projeto de CI/CD com Jenkins + GitHub + NGINX via Docker Compose

### 🛠️ Pré-requisitos
- Docker e Docker Compose instalados. Para instalar rapidamente, execute:
  ```bash
  chmod +x install_docker.sh
  ./install_docker.sh
  ```

### ▶️ Execução
- Inicie os serviços com o comando abaixo:
  ```bash
  docker compose up -d --build
  ```

### 🌐 Acesse os serviços:
- Jenkins: [http://localhost:8080](http://localhost:8080)
- NGINX: [http://localhost](http://localhost)

----

⚠️ Observações importantes
- A Instrução COPY em nginx/Dockerfile deve estar **COMENTADA na execução inicial dos containers**, mas deve ser **DESCOMENTADA quando for executada as builds da pipeline**.
