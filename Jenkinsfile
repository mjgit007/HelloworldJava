#!/usr/bin/env groovy
@Library('docker-shared-library@main') _

pipeline {
    agent any
     environment {
            DOCKER_REPO_SERVER = 'registry-1.docker.io/mjdockerrepo'
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
                           buildImage "${DOCKER_REPO_SERVER}/${APPNAME}:${IMAGE_NAME}"
                           dockerLogin ()
                           dockerPush "${DOCKER_REPO_SERVER}/${APPNAME}:${IMAGE_NAME}"
                      }
                  }
              }


     stage('run image') {
                       steps {
                           script {
                               echo "running the docker image..."
                                    sh "docker run -dp 8082:8080 --name javamvnapp ${DOCKER_REPO_SERVER}/${APPNAME}:${IMAGE_NAME}"


                           }
                       }
                   }


    }
}