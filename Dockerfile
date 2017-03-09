FROM openjdk:8u121-jre
MAINTAINER Smarsh <techops@smarsh.com>

#
# Some usefull environment variables
#
ENV SERVICE template
ENV USER nobody

#
# Java Memory Settings
#
ENV JAVA_XMX="1024m"
ENV JAVA_XMS="1024m"

#
# Create user to run service as
#
#RUN useradd -m $USER

# 
# our entry point script
#
COPY start.sh /

#
# copy in the application
#
COPY application.jar /

#
# switch to user 
#
#USER $USER

#
# standard tomcat web ports exposed
#
EXPOSE 8080/tcp 8443/tcp

#
# create our volume
#
#VOLUME [ "/path" ]

ENTRYPOINT [ "/start.sh" ]
