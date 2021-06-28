hadoop  jar ~/hadoop-streaming.jar \
    -input /labs/lab03data \
    -output /user/konstantin.parfenov/lab_3_filtered \
    -mapper lab_3_mapper.py \
    -jobconf mapred.reduce.tasks=0 \
    -file lab_3_mapper.py