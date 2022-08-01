FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN apt update
RUN apt install -y git
RUN apt install -y tomcat9
RUN 8
RUN apt install -y default-jdk
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN apt install -y maven
RUN cd boxfuse-sample-java-war-hello
RUN mvn package
EXPOSE 80
RUN cp target/hello-1.0.war /var/lib/tomcat/webapps/
CMD ["catalina.sh" "run"]


