beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;

CREATE TABLE pdriver_1 as
SELECT url, 
    COUNT(url) as pdrive_1
FROM domain_flag
GROUP BY url;



EOF