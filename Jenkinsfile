pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'subhash48/flask-docker-app'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url:'https://github.com/Subhashbgowda/flask-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}")
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh """
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push ${DOCKER_IMAGE}
                        """
                    }
                }
            }
        }
    }
}
