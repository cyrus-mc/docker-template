#!/bin/bash

# the assumption is that there will be a single executable JAR in the application directory
EXECUTABLE_JAR=`ls /application/*-executable.jar | head -1 2> /dev/null`

# exit out with message if we didn't find an executable JAR file
if [[ -z $EXECUTABLE_JAR ]]; then
  echo "Executable JAR not found, exiting"
  exit 255
fi

# allow invocation to modify Java command line options
if [ "${1:0:1}" = '-' ]; then
  set -- java "$@"
else
  set -- java -Xmx${JAVA_XMX} -Xms${JAVA_XMS} -jar -Dlogging.config=/config/log4j2.xml $EXECUTABLE_JAR --spring.config.name=${APPLICATION}.application
fi

# execute
exec "$@"
