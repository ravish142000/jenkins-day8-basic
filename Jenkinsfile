pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Build stage running'
            }
        }

        stage('Test') {
            steps {
                sh '''
                    echo "Running tests..." > test-report.txt
                    echo "Test failed at $(date)" >> test-report.txt
                    exit 1
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'test-reporrt.txt'
        }
    }
}
