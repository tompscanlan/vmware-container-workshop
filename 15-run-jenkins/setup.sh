docker pull jenkins/jenkins:lts
docker tag jenkins/jenkins:lts vic.home.local/jenkins/jenkins:lts
docker login vic.home.local
docker push vic.home.local/jenkins/jenkins:lts

docker volume create --opt "VolumeStore=default" --opt "Capacity=5G" jenkins_home

docker run -d --name jenkins-master --cpuset-cpus 2 -m 4g -p 8888:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home vic.home.local/jenkins/jenkins:lts

docker logs jenkins-master
