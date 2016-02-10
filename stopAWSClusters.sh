#!/bin/bash
echo "Stopping Cluster 1 on 52.4.67.120"
ssh -i /Users/lshannon/gemfire.pem ubuntu@52.4.67.120 /home/ubuntu/wan-sample/gemfire-package/scripts/shutdownCluster.sh
echo "Stopping Cluster 1 on 52.0.225.28"
ssh -i /Users/lshannon/gemfire.pem ubuntu@52.0.225.28 /home/ubuntu/wan-sample/gemfire-package2/scripts/shutdownCluster.sh
echo "Both Clusters Stopped"
