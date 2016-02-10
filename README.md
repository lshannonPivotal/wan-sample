# Gemfire WAN Sample
This shows how 2 different Gemfire/Geode clusters running on AWS can synchronize data from one cluster to the other using the WAN gateway.

## Update The Servers
Run the deployAWS.sh script to push all the scripts to the server
```shell
wan-sample git:(master) ./deployAWS.sh        
Uploading to AWS
.DS_Store                                                                                                                                                                         100% 6148     6.0KB/s   00:00    
cache.xml                                                                                                                                                                         100%  506     0.5KB/s   00:00    
gemfire.properties                                                                                                                                                                100%  533     0.5KB/s   00:00    
.DS_Store                                                                                                                                                                         100% 6148     6.0KB/s   00:00    
.DS_Store                                                                                                                                                                         100% 6148     6.0KB/s   00:00    
checkGateways.gfsh                                                                                                                                                                100%   52     0.1KB/s   00:00    
checkGateways.sh                                                                                                                                                                  100%  356     0.4KB/s   00:00    
clean_up.sh                                                                                                                                                                       100%  769     0.8KB/s   00:00    
data.gfsh                                                                                                                                                                         100%   52KB  51.6KB/s   00:00    
gfsh.sh                                                                                                                                                                           100%  378     0.4KB/s   00:00    
insertData.sh                                                                                                                                                                     100%  368     0.4KB/s   00:00    
shutdown-all.gf                                                                                                                                                                   100%   71     0.1KB/s   00:00    
shutdownCluster.sh                                                                                                                                                                100%  309     0.3KB/s   00:00    
startAll.sh                                                                                                                                                                       100% 2600     2.5KB/s   00:00    
.DS_Store                                                                                                                                                                         100% 6148     6.0KB/s   00:00    
cache.xml                                                                                                                                                                         100%  495     0.5KB/s   00:00    
gemfire.properties                                                                                                                                                                100%  528     0.5KB/s   00:00    
.DS_Store                                                                                                                                                                         100% 6148     6.0KB/s   00:00    
checkGateways.gfsh                                                                                                                                                                100%   52     0.1KB/s   00:00    
checkGateways.sh                                                                                                                                                                  100%  357     0.4KB/s   00:00    
clean_up.sh                                                                                                                                                                       100%  838     0.8KB/s   00:00    
gfsh.sh                                                                                                                                                                           100%  339     0.3KB/s   00:00    
shutdown-all.gf                                                                                                                                                                   100%   71     0.1KB/s   00:00    
shutdownCluster.sh                                                                                                                                                                100%  310     0.3KB/s   00:00    
startAll.sh                                                                                                                                                                       100% 2603     2.5KB/s   00:00    
Upload Completed
➜  wan-sample git:(master) 

```

## Start Up The Clusters

## Stopping The Clusters
Run the stopAWSClusters.sh script to stop Clusters
```shell
 wan-sample git:(master) ./stopAWSClusters.sh 
Stopping Cluster 1 on 52.4.67.120
1. Executing - connect --locator=172.31.38.93[10334]

Connecting to Locator at [host=172.31.38.93, port=10334] ..
Connecting to Manager at [host=ip-172-31-38-93.ec2.internal, port=1099] ..
Successfully connected to: [host=ip-172-31-38-93.ec2.internal, port=1099]

2. Executing - shutdown --include-locators=true

Shutdown is triggered

Stopping Cluster 1 on 52.0.225.28
1. Executing - connect --locator=172.31.38.94[10334]

Connecting to Locator at [host=172.31.38.94, port=10334] ..
Connecting to Manager at [host=ip-172-31-38-94.ec2.internal, port=1099] ..
Successfully connected to: [host=ip-172-31-38-94.ec2.internal, port=1099]

2. Executing - shutdown --include-locators=true

Shutdown is triggered

Both Clusters Stopped
```

## Clean Up The Working Directory
To delete the log files and stat files, run the ./cleanUpAWS.sh script
```shell
Cleaning Up AWS
/home/ubuntu/wan-sample/gemfire-package/members/ deleted
Java Processes Running:
zookeep+   1476      1  0 00:04 ?        00:00:06 /usr/bin/java -cp /etc/zookeeper/conf:/usr/share/java/jline.jar:/usr/share/java/log4j-1.2.jar:/usr/share/java/xercesImpl.jar:/usr/share/java/xmlParserAPIs.jar:/usr/share/java/netty.jar:/usr/share/java/slf4j-api.jar:/usr/share/java/slf4j-log4j12.jar:/usr/share/java/zookeeper.jar -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.local.only=false -Dzookeeper.log.dir=/var/log/zookeeper -Dzookeeper.root.logger=INFO,ROLLINGFILE org.apache.zookeeper.server.quorum.QuorumPeerMain /etc/zookeeper/conf/zoo.cfg
ubuntu    23332  23326  0 04:43 ?        00:00:00 grep java
Working Directory is now:
conf
lib
members
scripts
/home/ubuntu/wan-sample/gemfire-package2/members/ deleted
/home/ubuntu/wan-sample/gemfire-package2/members/ip-172-31-38-94_locator deleted
All Java Processes Killed
Java Processes Running:
ubuntu    16816  16810  0 04:43 ?        00:00:00 grep java
Working Directory is now:
Clean Up Completed
```
