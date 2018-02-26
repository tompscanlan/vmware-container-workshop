docker build -t default-project/jenkins .

docker run -d --name jenkins-master --privileged \
	-p 8080:8080 -p 50000:50000 \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v jenkins_home:/var/jenkins_home \
	default-project/jenkins

docker logs jenkins-master

