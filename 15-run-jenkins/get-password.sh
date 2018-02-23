docker exec jenkins-master cat /var/jenkins_home/secrets/initialAdminPassword

# or

docker stop jenkins-master
docker run -v jenkins_home:/jenkins_home busybox cat /jenkins_home/secrets/initialAdminPassword
docker start jenkins-master

