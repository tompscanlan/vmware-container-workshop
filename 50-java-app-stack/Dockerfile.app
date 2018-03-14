FROM os-layer

RUN yum install -y maven
RUN echo mvn build xxxx
CMD bash
