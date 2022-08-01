FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update
#RUN apt install -y git
RUN apt install -y tomcat9
RUN apt install -y default-jdk
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN apt install -y maven
WORKDIR /boxfuse-sample-java-war-hello/
RUN ls -l
RUN mvn package
WORKDIR /boxfuse-sample-java-war-hello/target/
№RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.16/bin/apache-tomcat-8.5.16.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.16/* /usr/local/tomcat/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
№EXPOSE 8080
№WORKDIR /usr/share/tomcat9/bin/

CMD ["/usr/share/tomcat/bin/catalina.sh" "run"]




