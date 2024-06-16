pipeline {
    agent any
    environment {
        PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin;C:\\Program Files\\Docker\\Docker\\resources;C:\\ProgramData\\DockerDesktop\\version-bin;C:\\Windows\\System32;${env.PATH}"
        DOCKER_CREDENTIALS_ID = 'docker-credentials'
        DOCKER_IMAGE = 'karyabarca/demoapp'
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Asegúrate de que Docker esté disponible
                    if (isUnix()) {
                        sh 'docker --version'
                    } else {
                        bat 'docker --version'
                    }

                    // Construir la imagen Docker
                    def customImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                    
                    // Subir la imagen a Docker Hub
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_CREDENTIALS_ID}") {
                        customImage.push()
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (isUnix()) {
                        sh 'docker run -d -p 8000:8000 --name demoapp ${DOCKER_IMAGE}:${env.BUILD_ID}'
                    } else {
                        bat 'docker run -d -p 8000:8000 --name demoapp ${DOCKER_IMAGE}:${env.BUILD_ID}'
                    }
                }
            }
        }
    }
}
