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
          // short commit (first 7 chars)
          def shortSha = (env.GIT_COMMIT ?: "").take(7)
          echo "Commit: ${env.GIT_COMMIT}"
          echo "Branch: ${env.GIT_BRANCH}"
          echo "Build Number: ${env.BUILD_NUMBER}"
          echo "Timestamp: ${new Date().toString()}"

          // set a friendly version and display name
          def version = "v${env.BUILD_NUMBER}-${shortSha}"
          currentBuild.displayName = version
          echo "Version: ${version}"
        }
      }
    }

    stage('Success') {
      steps {
        echo "Build completed successfully"
      }
    }
