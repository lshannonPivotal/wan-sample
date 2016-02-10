#!/bin/sh
export USER_HOME=/home/ubuntu/wan-sample/gemfire-package
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export GEMFIRE=/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux
export GF_JAVA=$JAVA_HOME/bin/java
export PATH=$PATH:$JAVA_HOME/bin:$GEMFIRE/bin
echo "Listing Gateways on Cluster 1"
gfsh run --file=checkGateways.gfsh
