beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;

CREATE TABLE count_driver_urls AS
    SELECT count(url) as sum_of_driver_urls
    FROM domain_flag
    WHERE auto_flag > 0
;

SELECT * 
FROM count_driver_urls;

EOF