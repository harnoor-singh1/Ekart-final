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
                    sh '. venv/bin/activate'

                    // Install dependencies
                    sh 'pip install -r requirements.txt'

                    // Install docker
                    sh '# Add Docker's official GPG key:
                         sudo apt-get update -y
                         sudo apt-get install ca-certificates curl gnupg
                         sudo install -m 0755 -d /etc/apt/keyrings
                         curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                         sudo chmod a+r /etc/apt/keyrings/docker.gp'
                
                    sh '# Add the repository to Apt sources:
                         echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
                         $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                         sudo apt-get update 
                         sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
                         docker -v'
                }
            }
        }
 }
}
