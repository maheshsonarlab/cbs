FROM tutum/centos
RUN yum -y update
RUN yum install -y java-1.8.0-openjdk
RUN java -version 
RUN mkdir temp && \
cd temp && \
curl -O  https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.36/bin/apache-tomcat-9.0.36.tar.gz && \
tar -xzvf apache-tomcat-9.0.36.tar.gz -C /opt/ && \
rm -rf temp
ENV JAVA_HOME /usr/lib/jvm/jre-openjdk
ENV PATH $PATH:$JAVA_HOME/bin
RUN echo $JAVA_HOME
COPY dbconfig.properties /opt/apache-tomcat-9.0.36/dbconfig.properties
COPY setenv.sh /opt/apache-tomcat-9.0.36/bin/setenv.sh
COPY consumerbank-user-reg-login.war /opt/apache-tomcat-9.0.36/webapps/consumerbank-user-reg-login.war
EXPOSE 8080
#Set default argument for entry point
CMD "cd /opt/apache-tomcat-9.0.36/bin/"
#CMD catalina.sh run
#Defining what our container runs
ENTRYPOINT ["/opt/apache-tomcat-9.0.36/bin/catalina.sh","run"]
#CMD ["/opt/apache-tomcat-9.0.35/bin/catalina.sh run"]
#CMD ["bash"]
