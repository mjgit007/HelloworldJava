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
                sh 'mvn package'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}
