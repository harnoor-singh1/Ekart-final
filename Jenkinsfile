pipeline {
    agent any

    stages {
        stage('Checkout') { 
            steps {
                checkout scm
            }
              
          }
        stage('Install Python Virtual Environment') {
            steps {
                script {
                    // Install Python3.10-venv using apt-get
                    sh 'sudo apt-get update'
                    sh 'sudo apt-get install -y python3.10-venv'
                }
            }
        }

        stage('Build and Test') {
            steps {
                script {
                    // Set up Python virtual environment
                    sh 'python3 -m venv venv'
                    sh 'source venv/bin/activate'

                    // Install dependencies
                    sh 'pip install -r requirements.txt'

                    // Run unit tests and generate JUnit XML report
                    sh 'python -m unittest discover -v --junit-xml test-results.xml'
                }
            }
        }
 }
}
