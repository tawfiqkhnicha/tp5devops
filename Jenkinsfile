pipeline {
    agent {
        docker {
            image 'maven:3.8.6-openjdk-17'
        }
    }

    environment {
        IMAGE_NAME = "tawfiqkhnicha/tp5devops"
        CONTAINER_NAME = "tp5devops_container"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/tawfiqkhnicha/tp5devops.git'
            }
        }

        stage('Build & Test') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${IMAGE_NAME}:latest ."
            }
        }

        stage('Run Docker Container') {
            steps {
                sh "docker run -d --name ${CONTAINER_NAME} -p 8080:8080 ${IMAGE_NAME}:latest"
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'dockerhub_pwd', url: '']) {
                    sh "docker tag ${IMAGE_NAME}:latest ${IMAGE_NAME}:latest"
                    sh "docker push ${IMAGE_NAME}:latest"
                }
            }
        }
    }

    post {
        success {
            echo "Deployment successful!"
        }
        failure {
            echo "Build failed, check logs."
        }
    }
}
