# cicd
Instalação completa de um ambiente de CI/CD

conteudo Jenksfile:

'''
pipeline {
    agent any
    stages {
        stage('Pull Repository') {
            steps {
                sh 'git pull https://github.com/eliezershell/nginx-content.git main'
            }
        }
        stage('Build and Deploy') {
            steps {
                sh '''
                rm -rf /mnt/web-content/*
                cp -r /var/jenkins_home/workspace/web-content/nginx-content/* /mnt/web-content
                '''
            }
        }
    }
}
'''
