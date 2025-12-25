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
                    mkdir -p reports
                    echo "Test failed" > reports/test-report.txt
                    exit 1
                '''
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'reports/test-report.txt'
        }
    }
}
