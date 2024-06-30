pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/karyabarca/demoapp.git'
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'python3 -m venv venv'
                    sh 'chmod +x ./venv/bin/pip'
                    sh './venv/bin/pip install -r requirements.txt'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh './venv/bin/python -m pytest tests/'
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t demoapp .'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d --name demoapp-container -p 5000:5000 demoapp'
                }
            }
        }
    }
}
