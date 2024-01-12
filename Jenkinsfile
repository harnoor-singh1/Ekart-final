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
                    sh 'sudo apt-get install -y python-pip'
                    sh 'python3 --version'
                }
            }
        }

        stage('Build and Test') {
            steps {
                script {
                    // Set up Python virtual environment
                    sh 'python3 -m venv venv'
                    sh '. venv/bin/activate'

                    // Install dependencies
                    sh 'pip install -r requirements.txt'

                    // Install docker
                    sh 'sudo apt-get update -y'
                    sh 'sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin'
                    sh 'docker -v'

                    // Install Postgresql
                    sh 'sudo apt-get update -y'
                    sh 'sudo apt-get install postgresql postgresql-contrib'
                    sh 'sudo -u postgres psql'

                    // password enter
                    sh '\password postgres'
                    sh 'root123'
                    
                    // Create database
                    sh 'CREATE database flask;'

                    // Run applicatiom
                    sh 'python3 app.py'
                }
            }
        }
 }
}
