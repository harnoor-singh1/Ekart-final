pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
              
          }
        stage('Build and Test') {
            steps {
                script {
                    // Set up Python virtual environment
                    sudo apt install python3.10-venv
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
