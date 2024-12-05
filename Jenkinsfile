pipeline {
    agent any  // Runs the pipeline on any available agent

    environment {
        APP_NAME = "jenkins-web-app"
        DOCKER_IMAGE = "jenkins-web-app-image"
        DOCKER_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from version control (e.g., GitHub)
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using the Dockerfile
                    echo "Building Docker image for ${DOCKER_IMAGE}:${DOCKER_TAG}"
                    sh """
                    docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
                    """
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy the Docker container to serve the static website
                    echo "Deploying Docker container for ${APP_NAME}..."
                    sh """
                    docker run -d -p 8081:8081 ${DOCKER_IMAGE}:${DOCKER_TAG}
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline finished successfully! The application is deployed."
        }
        failure {
            echo "Pipeline failed, please check the logs."
        }
        always {
            echo "Cleaning up..."
        }
    }
}
