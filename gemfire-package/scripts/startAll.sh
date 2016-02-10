#!/bin/sh
echo "****Starting The Local Cluster 1 on 52.4.67.120****"

##Set Variables
export HOSTNAME=$(hostname)
export LOCATOR_NAME="$(hostname)_locator"
export SERVER_NAME="$(hostname)_server"
export WORKING_DIRECTORY=/home/ubuntu/wan-sample/gemfire-package
export CONF_DIR=$WORKING_DIRECTORY/conf
export SERVER_DIR_LOCATION=$WORKING_DIRECTORY/members
export IP_ADDRESS=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
export LOCATOR_PORT=10334
export SERVER_HEAP=1g
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export GEMFIRE=/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux
export GF_JAVA=$JAVA_HOME/bin/java
export PATH=$PATH:$JAVA_HOME/bin:$GEMFIRE/bin
export CLASSPATH=$CLASSPATH:$GEMFIRE/lib/*:$JAVA_HOME/lib/tools.jar:$CONF_DIR/:$CONF_DIR/*

##Create the member directory for the locator
if [ ! -d "$SERVER_DIR_LOCATION/$LOCATOR_NAME" ]; then
	mkdir $SERVER_DIR_LOCATION/$LOCATOR_NAME
	echo "Created the $LOCATOR_NAME directory"
fi

#Start up the Locator - it needs to point to the locator in the other cluster
echo "Starting Up Cluster 1./ Locator: $LOCATOR_NAME running on port $LOCATOR_PORT"
gfsh start locator --name=$LOCATOR_NAME \
--locators=$IP_ADDRESS[$LOCATOR_PORT] \
--bind-address=$IP_ADDRESS \
--enable-cluster-configuration=false \
--dir=$SERVER_DIR_LOCATION/$LOCATOR_NAME \
--port=$LOCATOR_PORT \
--J=-Xms256m \
--J=-Xmx256m \
--J=-XX:+PrintFlagsFinal \
--log-level=error \
--J=-Dcom.sun.management.jmxremote \
--J=-Dcom.sun.management.jmxremote.port=15666 \
--J=-Dcom.sun.management.jmxremote.ssl=false \
--J=-Dcom.sun.management.jmxremote.authenticate=false \
--J=-Dcom.sun.management.jmxremote.local.only=false \
--J='-Dgemfire.remote-locators=172.31.38.94[10334]' \
--J='-Dgemfire.distributed-system-id=1'

##Create the member director for the server
echo "****Starting Server 1****"
if [ ! -d "$SERVER_DIR_LOCATION/$SERVER_NAME" ]; then
  mkdir $SERVER_DIR_LOCATION/$SERVER_NAME
  mkdir $SERVER_DIR_LOCATION/$SERVER_NAME/data
  echo "Created $SERVER_NAME directory"

fi

##Start up the server
gfsh start server --name=$SERVER_NAME \
--use-cluster-configuration=false \
--classpath=$CLASSPATH \
--bind-address=$IP_ADDRESS \
--dir=$SERVER_DIR_LOCATION/$SERVER_NAME \
--locators=$IP_ADDRESS[$LOCATOR_PORT] \
--properties-file=$CONF_DIR/gemfire.properties \
--rebalance=true \
--J=-Xms256m \
--J=-Xmx256m \
--J=-XX:+PrintFlagsFinal \
--cache-xml-file=$CONF_DIR/cache.xml \
--server-port=0 \
--J=-Dgemfire.start-dev-rest-api=true \
--J=-Dgemfire.http-service-port=8083

echo "****Local Cluster 1 Started on 52.4.67.120****"
