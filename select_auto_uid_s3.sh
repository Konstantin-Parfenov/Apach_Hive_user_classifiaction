beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;

CREATE TABLE auto_urls AS
SELECT t1.uid, t1.ts, t1.url 
FROM main_table AS t1
    INNER JOIN
    (SELECT uid
    FROM main_table_s3
    WHERE ug_f1>0) AS t2
    ON t1.uid = t2.uid;


EOF