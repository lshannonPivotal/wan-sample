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


```shell
Starting Cluster 1 on 52.4.67.120
****Starting The Local Cluster 1 on 52.4.67.120****
Created the ip-172-31-38-93_locator directory
Starting Up Cluster 1./ Locator: ip-172-31-38-93_locator running on port 10334
..............................
Locator in /home/ubuntu/wan-sample/gemfire-package/members/ip-172-31-38-93_locator on ip-172-31-38-93.ec2.internal[10334] as ip-172-31-38-93_locator is currently online.
Process ID: 23467
Uptime: 15 seconds
GemFire Version: 8.1.0
Java Version: 1.8.0_66
Log File: /home/ubuntu/wan-sample/gemfire-package/members/ip-172-31-38-93_locator/ip-172-31-38-93_locator.log
JVM Arguments: -Dgemfire.locators=172.31.38.93[10334] -Dgemfire.enable-cluster-configuration=false -Dgemfire.load-cluster-configuration-from-dir=false -Dgemfire.log-level=error -Xms256m -Xmx256m -XX:+PrintFlagsFinal -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=15666 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.local.only=false -Dgemfire.remote-locators=172.31.38.94[10334] -Dgemfire.distributed-system-id=1 -Dgemfire.launcher.registerSignalHandlers=true -Djava.awt.headless=true -Dsun.rmi.dgc.server.gcInterval=9223372036854775806
Class-Path: /home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/gemfire.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/locator-dependencies.jar

Successfully connected to: [host=ip-172-31-38-93.ec2.internal, port=1099]

.....FULL OUTPUT OMITTED FOR BREVITY.....

Pivotal_GemFire_810_b50625_Linux/lib/spring-context-support-3.2.12.RELEASE.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/mx4j-tools.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/snappy-java-1.0.4.1.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/spring-aop-3.2.12.RELEASE.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/spring-shell-1.0.0.RELEASE.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/spring-tx-3.2.12.RELEASE.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/jetty-xml-9.2.3.v20140905.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/mx4j-remote.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/server-dependencies.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/spring-context-3.2.12.RELEASE.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/commons-io-2.3.jar:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/mx4j.jar:/usr/lib/jvm/java-8-oracle/lib/tools.jar:/home/ubuntu/wan-sample/gemfire-package2/conf/:/home/ubuntu/wan-sample/gemfire-package2/conf/*:/home/ubuntu/cluster/gemfire-ubuntu-package/Pivotal_GemFire_810_b50625_Linux/lib/server-dependencies.jar

****Local Cluster 2 Started on 52.0.225.28****
Both Clusters Started
```

##Log Into gfsh on both servers
Cluster 1
```shell
ubuntu@ip-172-31-38-93:~/wan-sample/gemfire-package/scripts$ ./gfsh.sh 
Please use 'connect --locator=172.31.38.93[10334]' to connect Gfsh to the locator
    _________________________     __
   / _____/ ______/ ______/ /____/ /
  / /  __/ /___  /_____  / _____  / 
 / /__/ / ____/  _____/ / /    / /  
/______/_/      /______/_/    /_/    v8.1.0

Monitor and Manage GemFire
gfsh>connect --locator=172.31.38.93[10334]
Connecting to Locator at [host=172.31.38.93, port=10334] ..
Connecting to Manager at [host=ip-172-31-38-93.ec2.internal, port=1099] ..
Successfully connected to: [host=ip-172-31-38-93.ec2.internal, port=1099]

Cluster-1 gfsh>
```
Cluster 2
```shell
ubuntu@ip-172-31-38-94:~/wan-sample/gemfire-package2/scripts$ ./gfsh.sh 
Use connect --locator=172.31.38.94[10334]
    _________________________     __
   / _____/ ______/ ______/ /____/ /
  / /  __/ /___  /_____  / _____  / 
 / /__/ / ____/  _____/ / /    / /  
/______/_/      /______/_/    /_/    v8.1.0

Monitor and Manage GemFire
gfsh>connect --locator=172.31.38.94[10334]
Connecting to Locator at [host=172.31.38.94, port=10334] ..
Connecting to Manager at [host=ip-172-31-38-94.ec2.internal, port=1099] ..
Successfully connected to: [host=ip-172-31-38-94.ec2.internal, port=1099]

Cluster-2 gfsh>
```
## Make Sure Receiver and Sender are started


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
## Start the Gateways
Start the Receiver
```shell
Cluster-2 gfsh>start gateway-receiver
                        Member                          | Result | Message
------------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------
ip-172-31-38-94(ip-172-31-38-94_server:17176)<v1>:54376 | OK     | GatewayReceiver is started on member ip-172-31-38-94(ip-172-31-38-94_server:17176)<v1>:54376

Cluster-2 gfsh>
```
Start the Sender
```shell
Cluster-1 gfsh>start gateway-sender --id=sender
                        Member                          | Result | Message
------------------------------------------------------- | ------ | -------------------------------------------------------------------------------------------------
ip-172-31-38-93(ip-172-31-38-93_server:23707)<v1>:54754 | OK     | GatewaySender sender is started on member ip-172-31-38-93(ip-172-31-38-93_server:23707)<v1>:54754

Cluster-1 gfsh>
```

## Put Data Into The Sender
From the send server run the insertData.sh. This will insert 1000 values into the Cluster.
```shell
999. Executing - put --region=/customers --key="998" --value="Bobby"

Result      : true
Key Class   : java.lang.String
Key         : 998
Value Class : java.lang.String
Old Value   : <NULL>


1000. Executing - put --region=/customers --key="999" --value="Russell"

Result      : true
Key Class   : java.lang.String
Key         : 999
Value Class : java.lang.String
Old Value   : <NULL>


1001. Executing - put --region=/customers --key="1000" --value="Helen"

Result      : true
Key Class   : java.lang.String
Key         : 1000
Value Class : java.lang.String
Old Value   : <NULL>


Done Putting Data
ubuntu@ip-172-31-38-93:~/wan-sample/gemfire-package/scripts$
```
The data can be verified in gfsh on Cluster 1

```shell
Cluster-1 gfsh>query --query="select * from /customers"

Result     : true
startCount : 0
endCount   : 20
Rows       : 1000

Result
--------
Annie
Annie
Annie
Annie
Margaret
Margaret
Margaret
Margaret
Harry
Harry
Harry
Doris
Doris
Doris
Doris
Doris
Doris
Doris
Doris
Louis
Louis

Press n to move to next page, q to quit and p to previous page : 
```
## Verify Data On Cluster 2
To test the WAN a query of Cluster 2 will verify the data put into Cluster 1 is now present in Cluster 2.

```shell
gfsh>query --query="select * from /customers"

Result     : true
startCount : 0
endCount   : 20
Rows       : 1000

Result
--------
Annie
Annie
Annie
Annie
Margaret
Margaret
Margaret
Margaret
Harry
Harry
Harry
Doris
Doris
Doris
Doris
Doris
Doris
Doris
Doris
Louis
Louis

Press n to move to next page, q to quit and p to previous page : 
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
