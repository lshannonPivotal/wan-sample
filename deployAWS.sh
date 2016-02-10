#!/bin/bash
echo "Uploading to AWS"
scp -r -i /Users/lshannon/gemfire.pem ./gemfire-package ubuntu@52.4.67.120:/home/ubuntu/wan-sample
scp -r -i /Users/lshannon/gemfire.pem ./gemfire-package2 ubuntu@52.0.225.28:/home/ubuntu/wan-sample
echo "Upload Completed"
