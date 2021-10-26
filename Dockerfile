FROM centos
MAINTAINER manu@exchangeonline.in
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-8///v8.5.71/bin/apache-tomcat-8.5.71.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.71/* /opt/tomcat/.
RUN yum -y install java
RUN java -version
WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/clouditspace/k8s/blob/50be0886c774c1df1d1e5bf0810574ab971f4c91/samplewebapp.war
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
