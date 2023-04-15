pipeline {
    agent { dockerfile true }

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building..'
                script {
                    def dockerImage = docker.build("my-django-app:${env.BUILD_NUMBER}", "-f Dockerfile .")
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('Outputs') {
            steps {
                echo "Running build number: ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
    }
}
