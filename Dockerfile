FROM openjdk:8u121-jre
MAINTAINER Smarsh <techops@smarsh.com>

#
# Some usefull environment variables
#
ENV APPLICATION template
ENV USER nobody

#
# Java Memory Settings
#
ENV JAVA_XMX="1024m"
ENV JAVA_XMS="1024m"

# additional java settings
ENV JAVA_OPTS=""

#
# Create user to run service as
#
#RUN useradd -m $USER

# 
# our entry point script
#
COPY scripts/start.sh /

#
# copy application (JAR, config, etc)
#
COPY application/* /application/
COPY config/* /config/

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
