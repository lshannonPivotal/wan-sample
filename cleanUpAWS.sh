#!/bin/bash
echo "Cleaning Up AWS"
ssh -i /Users/lshannon/gemfire.pem ubuntu@52.4.67.120 /home/ubuntu/wan-sample/gemfire-package/scripts/clean_up.sh
ssh -i /Users/lshannon/gemfire.pem ubuntu@52.0.225.28 /home/ubuntu/wan-sample/gemfire-package2/scripts/clean_up.sh
echo "Clean Up Completed"
