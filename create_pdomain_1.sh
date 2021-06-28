beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;

CREATE TABLE pdomain_1 as
SELECT url, 
    SUM(auto_flag) as pdom_1
FROM domain_flag
GROUP BY url;


EOF