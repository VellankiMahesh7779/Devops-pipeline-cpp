pipeline {

    agent any

    stages {

        stage('Build C++') {
            steps {
                sh '''
                cd app/src
                g++ *.cpp -o app -pthread
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t devops-cpp-app .
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop devops-cpp-container || true
                docker rm devops-cpp-container || true

                docker run -d \
                --name devops-cpp-container \
                -p 9090:9090 \
                devops-cpp-app
                '''
            }
        }
    }
}
