pipeline {
    agent any
     environment {
            DOCKER_REPO_SERVER = 'registry.digitalocean.com/myorgdockerrepo'
            IMAGE_NAME = 1.0
            APPNAME = 'javamvnapp'
        }


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

      stage('build image') {
                  steps {
                      script {
                          echo "building the docker image..."
                          withCredentials([usernamePassword(credentialsId: 'digi_docker_cred', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                              sh "docker build -t ${DOCKER_REPO_SERVER}/${APPNAME}:${IMAGE_NAME} ."
                              sh "echo $PASS | docker login -u $USER --password-stdin ${DOCKER_REPO_SERVER}"
                              sh "docker push ${DOCKER_REPO_SERVER}/${APPNAME}:${IMAGE_NAME}"
                          }
                      }
                  }
              }

    }
}