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
    }
}
