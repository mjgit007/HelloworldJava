pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                echo 'Testing started ..'
                sh 'mvn test'
            }
        }
        stage('Build') {
            steps {
                echo 'Building started ..'
                sh 'mvn build'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}