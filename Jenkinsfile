pipeline {
    agent any
#    environment {
#        DJANGO_SECRET_KEY = credentials('django-secret-key')
#        DOCKER_REGISTRY_URL = 'docker.io'
#        DOCKER_REGISTRY_CREDENTIALS = credentials('docker-registry')
#    }
    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
                sh 'python manage.py collectstatic --noinput'
                sh 'docker build -t myapp .'
            }
        }
        stage('Test') {
            steps {
                sh 'python manage.py test --noinput'
                step([$class: 'JUnitResultArchiver', testResults: 'reports/**/*.xml'])
                step([$class: 'CoberturaPublisher', coberturaReportFile: 'reports/coverage.xml'])
            }
        }
        stage('Deploy') {
            steps {
#                withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'ssh-credentials', usernameVariable: 'SSH_USERNAME', passwordVariable: 'SSH_PASSWORD']]) {
#                    sh 'sshpass -p "$SSH_PASSWORD" scp -r -o StrictHostKeyChecking=no myapp user@server:/opt/myapp'
#                    sshCommand remoteUser: "user", remoteHost: "server", sshKeyVariant: 'ssh', sshKeyFile: [credentials('ssh-key').getPrivateKey()], command: 'cd /opt/myapp && docker-compose up -d'
#
sh 'echo not yet...'
                }
            }
        }
    }
}

