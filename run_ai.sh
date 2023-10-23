#!/bin/bash
bn=$(basename "$1")
# clean the file name for the job name: remove the .sh extension, replace "_" with "-"
JOB_NAME=$(echo "$bn" | sed "s/\..*//" | sed "s/_/-/g")

# read bash scripts about parsing the arguments
runai submit newloss-exp106 \
       --backoff-limit 1 \
       --gpu 2 \
       --image 10.202.67.207:5000/tshi:image-ts \
       --large-shm \
       --project tang \
       -v /nfs:/nfs \
       --command \
       -- bash /nfs/home/tshi/code/create_an_image/docker/docker/run_ai_avt.sh \
       #-- interactive
       #--run-as-user \
       ## to get the output of the running job, use and change the following line:
       #--port 8080:80 --service-type loadbalancer --port 8080 --service-type ingress
