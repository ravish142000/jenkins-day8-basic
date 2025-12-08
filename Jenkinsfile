pipeline {
  agent any

  environment {
    IMAGE_NAME = 'ravi-demo'            // change if you prefer another repo name
    TAG = "${env.BUILD_NUMBER ?: 'local'}"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

   stage('Test') {
    steps {
	echo "running simple shell test..."
	sh './test.sh'
	}
    }
    stage('Build Docker Image') {
      steps {
        echo "Building image ${IMAGE_NAME}:${TAG}"
        sh "docker build -t ${IMAGE_NAME}:${TAG} ."
      }
    }

    stage('Login & Push to Docker Hub') {
      steps {
        // uses credentials id 'dockerhub' you added in Jenkins (username/password)
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PSW')]) {
          sh '''
            echo "Logging in to Docker Hub as $DOCKERHUB_USER"
            echo "$DOCKERHUB_PSW" | docker login -u "$DOCKERHUB_USER" --password-stdin

            # tag with username/repo:tag (Docker Hub expects username/repo)
            docker tag ${IMAGE_NAME}:${TAG} ${DOCKERHUB_USER}/${IMAGE_NAME}:${TAG}

            echo "Pushing ${DOCKERHUB_USER}/${IMAGE_NAME}:${TAG}"
            docker push ${DOCKERHUB_USER}/${IMAGE_NAME}:${TAG}
          '''
        }
      }
    }
  }

  post {
    success {
      echo "Pipeline finished: pushed ${IMAGE_NAME}:${TAG}"
    }
    failure {
      echo "Pipeline failed"
    }
  }
}
