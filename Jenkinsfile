pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Info') {
      steps {
        script {
          echo "Commit: ${env.GIT_COMMIT}"
          echo "Branch: ${env.GIT_BRANCH}"
          echo "Build Number: ${env.BUILD_NUMBER}"
          echo "Timestamp: ${new Date().toString()}"
        }
      }
    }

    stage('Success') {
      steps {
        echo "Build completed successfully"
      }
    }
  }

  post {
    always {
      echo "Post: build finished"
    }
  }
}
