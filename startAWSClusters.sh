#!/bin/bash
echo "Starting Cluster 1 on 52.4.67.120"
ssh -i /Users/lshannon/gemfire.pem ubuntu@52.4.67.120 /home/ubuntu/wan-sample/gemfire-package/scripts/startAll.sh
echo "Starting Cluster 1 on 52.0.225.28"
ssh -i /Users/lshannon/gemfire.pem ubuntu@52.0.225.28 /home/ubuntu/wan-sample/gemfire-package2/scripts/startAll.sh
echo "Both Clusters Started"
