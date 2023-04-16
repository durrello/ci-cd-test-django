pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building..'
                script {
                    def dockerImage = docker.build("my-django-app", "-f Dockerfile .")
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'docker run -d --name my-django-app-container${env.BUILD_ID} -p 8000:81 my-django-app'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('Outputs') {
            steps {
                echo "Running build number: ${env.BUILD_ID} on ${env.JENKINS_URL}:81"
            }
        }
    }
}
