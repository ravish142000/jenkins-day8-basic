pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Checking out code...'
                checkout scm
            }
        }

        stage('Test') {
            steps {
                echo 'Running simple shell test...'
                sh './test.sh'
            }
        }

        stage('Build Image') {
            steps {
                echo 'Building Docker image...'
                // build only with local tag
                sh "docker build -t jenkins-day8-basic:${env.BUILD_NUMBER} ."
            }
        }

        stage('Tag & Push Image') {
            steps {
                echo 'Tagging and pushing Docker image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds',
                                                 usernameVariable: 'DOCKERHUB_USER',
                                                 passwordVariable: 'DOCKERHUB_PASS')]) {

                    // tag using injected DOCKERHUB_USER
                    sh "docker tag jenkins-day8-basic:${env.BUILD_NUMBER} ${DOCKERHUB_USER}/jenkins-day8-basic:${env.BUILD_NUMBER}"
                    sh "docker tag jenkins-day8-basic:${env.BUILD_NUMBER} ${DOCKERHUB_USER}/jenkins-day8-basic:latest"

                    // login and push
                    sh "echo \$DOCKERHUB_PASS | docker login -u \$DOCKERHUB_USER --password-stdin"
                    sh "docker push ${DOCKERHUB_USER}/jenkins-day8-basic:${env.BUILD_NUMBER}"
                    sh "docker push ${DOCKERHUB_USER}/jenkins-day8-basic:latest"
                    sh "docker logout"
                }
            }
        }

    }

    post {
        success {
            echo "Pipeline succeeded!"
        }
        failure {
            echo "Pipeline failed!"
        }
        always {
            echo "Cleaning up workspace..."
        }
    }
}
