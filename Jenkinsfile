pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials-id') // Replace with your DockerHub credentials ID
        DOCKERHUB_REPO = 'yourdockerhubusername/your-repo' // Replace with your DockerHub repo
        GITHUB_REPO = 'https://github.com/yourusername/your-repo.git' // Replace with your GitHub repo
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${env.GITHUB_REPO}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${env.DOCKERHUB_REPO}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${env.DOCKERHUB_CREDENTIALS}") {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh 'docker run -d -p 8080:8080 ${env.DOCKERHUB_REPO}'
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
