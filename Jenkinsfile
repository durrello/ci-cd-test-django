pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
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
                    sh 'echo not yet...'
                }
            }
        }
    }
