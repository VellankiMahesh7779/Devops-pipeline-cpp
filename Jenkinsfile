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
                docker build -t vellankimahesh1999/devops-cpp-app:v2 .
                '''
            }
        }

        // stage('Deploy To Kubernetes') {
        //     steps {
        //         sh '''
        //         kubectl rollout restart deployment devops-cpp-app
        //         '''
        //     }
        }
    }
}
