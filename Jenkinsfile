pipeline {
    agent any
    stages {
        stage('Clonando o Repositório') {
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
        stage('Copiando Conteúdo') {
            steps {
                script {
                    sh '''
                        mkdir -p /nginx-content
			            rm -rf /nginx-content/*
                        cp -r ./nginx-content/* /nginx-content/
                    '''
                }
            }
        }
        stage('Build e Deploy') {
            steps {
                sh 'docker compose -f /cicd/docker-compose.yml up -d --no-deps --build nginx'
            }
        }
    }
}
