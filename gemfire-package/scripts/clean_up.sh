#!/bin/bash
export USER_HOME=/home/ubuntu/wan-sample/gemfire-package
export SERVER_DIR_LOCATION=$USER_HOME/members
export LOCATOR_NAME="$(hostname)_locator"
export SERVER_NAME="$(hostname)_server"

if [ -d "$SERVER_DIR_LOCATION/$SERVER_NAME" ]; then
	rm -fr $SERVER_DIR_LOCATION/$SERVER_NAME
	echo "$SERVER_DIR_LOCATION/$SERVER_NAME deleted"
fi
if [ -d "$SERVER_DIR_LOCATION/$SERVER_NAME2" ]; then
	rm -fr $SERVER_DIR_LOCATION/$SERVER_NAME2
	echo "$SERVER_DIR_LOCATION/$SERVER_NAME2 deleted"
fi
if [ -d "$SERVER_DIR_LOCATION/$LOCATOR_NAME" ]; then
	rm -fr $SERVER_DIR_LOCATION/$LOCATOR_NAME
	echo "$SERVER_DIR_LOCATION/$LOCATOR_NAME deleted"
fi
mkdir $SERVER_DIR_LOCATION
echo "Java Processes Running:"
ps -ef | grep java
echo "Working Directory is now:"
ls $USER_HOME
