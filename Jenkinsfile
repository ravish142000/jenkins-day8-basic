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
          // get short SHA from workspace
          def shortSha = sh(returnStdout: true, script: 'git rev-parse --short HEAD').trim()
          // determine branch (fallback if env var not present)
          def branch = env.GIT_BRANCH ?: sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
          echo "Commit: ${shortSha}"
          echo "Branch: ${branch}"
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
  } // end stages

  post {
    always {
      echo "Post: build finished"
    }
  }
} // end pipeline
