#!/bin/bash
echo "Inserting Data in Cluster 1 on 52.4.67.120"
ssh -i /Users/lshannon/gemfire.pem ubuntu@52.4.67.120 /home/ubuntu/wan-sample/gemfire-package/scripts/insertData.sh
