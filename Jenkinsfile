pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building..'
                script {
                    def dockerImage = docker.build("my-django-app:${env.BUILD_ID}", "-f Dockerfile .")
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh "docker run -d --name my-django-app-container-${env.BUILD_ID} -p 8000:80 my-django-app:${env.BUILD_ID}"
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
