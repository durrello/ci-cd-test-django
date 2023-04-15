pipeline {
    agent { 
      docker {
      // Use the Dockerfile to build the image
      dockerfile {
        filename 'Dockerfile'
        args '-v $PWD:/app'
      }
      // Specify the image tag
      image 'my-django-app:${env.BUILD_ID}'
      // Run the container on port 8000
      args '-p 8000:8000'
    }
  }

    stages {
        stage('Build Docker Image') {
            steps {
                echo 'Building..'
                script {
                    def dockerImage = docker.build("my-django-app-in-build-step:${env.BUILD_NUMBER}", "-f Dockerfile .")
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
