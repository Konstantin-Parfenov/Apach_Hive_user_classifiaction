beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;

CREATE TABLE count_all_urls AS
    SELECT count(url) as sum_of_urls
    FROM domain_flag
;
EOF