pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id')
        registry = 'docker.io'  
        registryCredential = 'personal-docker'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git url: 'https://github.com/faraz9993/Day_14.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t fansari9993/test9:latest .'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    withDockerRegistry([credentialsId: 'dockerhub-credentials-id', url: 'https://index.docker.io/v1/']) {
                        sh 'docker push fansari9993/test9:latest'
                    }
                }
            }
        }
        stage('Deploy Container') {
            steps {
                script {
                    sh 'docker run -d -p 80:80 fansari9993/test9:latest'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
