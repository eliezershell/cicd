# CI/CD
Instalação completa de um ambiente de CI/CD

conteúdo Jenksfile:

```
pipeline {
    agent any
    stages {
        stage('Preparando o Repositório') {
            steps {
                if (currentBuild.number == 1){
                    sh 'git clone https://github.com/eliezershell/nginx-content.git'   
                } else {
                    sh 'git pull origin main'
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
