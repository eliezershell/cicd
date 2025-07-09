# CI/CD
Instalação completa de um ambiente de CI/CD

## Instalação

Siga estas etapas para instalar o ambiente de CI/CD em seu serviidor:

1. **Clone este repositório:**
   ```
   git clone https://github.com/eliezershell/cicd.git
   ```

2. **Execute o script de instalação do Docker:**
   ```
   cd cicd; chmod +x install.sh; ./install.sh
   ```
2. **Execute o script de inicialização do Docker Compose:**
   ```
   docker-compose up -d
   ```

conteúdo Jenksfile:

```
pipeline {
    agent any
    stages {
        stage('Preparando o Repositório') {
            steps {
                script {
                    if (currentBuild.number == 1){
                        sh 'git clone https://github.com/eliezershell/nginx-content.git'   
                    } else {
                        sh 'git -C ./nginx-content pull origin main'
                    }
                }
            }
        }
        stage('Build e Deploy') {
            steps {
                sh '''
                rm -rf /mnt/web-content/*
                cp -r /var/jenkins_home/workspace/web-content/nginx-content/* /mnt/web-content
                '''
            }
        }
    }
}
```

Conteúdo do Script na Pipeline:

```
#!/bin/bash

if [ $BUILD_NUMBER == 1 ]; then
git clone https://github.com/eliezershell/nginx-content.git
else
git -C ./nginx-content pull origin main
fi

rm -rf /mnt/web-content/*
cp -r /var/jenkins_home/workspace/web-content/nginx-content/* /mnt/web-content
```
