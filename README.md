# wan-sample
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

