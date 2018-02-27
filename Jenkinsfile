pipeline {
    agent any

   stages {
       stage('get task') {
           agent { docker 'golang:1.10.0-stretch' }
           steps {
               timeout(time: 5, unit: 'MINUTES') {
                   sh '''
                     go get -u -v github.com/go-task/task/cmd/task
                     cp /go/bin/task task
                   '''
                   stash includes: 'task', name: 'task'
               }
           }
       }
       stage('build') {
           agent { docker 'default-project/jenkins:latest' }
           steps {
               timeout(time: 5, unit: 'MINUTES') {
                   unstash 'task'
                   sh '''
                     cp task /bin/
                     task
                   '''
               }
           }
       }
   }

}
