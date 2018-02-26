pipeline {
    agent any
    stages {
        stage('get task') {
            agent { docker 'golang:1.10.0-stretch' }
            steps {
                sh '''
                  ls -al
                  apt-get update
                  apt-get install -y git
                  go get -u -v github.com/go-task/task/cmd/task
                  cp /go/bin/task task
                '''
                stash includes: 'task', name: 'task'
            }
        }
        stage('build') {
            agent { docker 'default-project/jenkins:latest' }
            steps {
                unstash 'task'
                sh '''
                  cp task /bin/
                  ls -al
                  env
                  ./task
                '''
            }
        }
    }
}
