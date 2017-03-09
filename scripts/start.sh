#!/bin/bash

# first check if we're passing flags, if so
# prepend 
if [ "${1:0:1}" = '-' ]; then
  set -- java "$@"
else
  set -- java -Xmx${JAVA_XMX} -Xms${JAVA_XMS} -jar application.jar
fi

# execute
exec "$@"
#exec java -Xmx${JAVA_XMX} -Xms${JAVA_XMS} -jar application.jar
