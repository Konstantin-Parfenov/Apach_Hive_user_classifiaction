beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;

CREATE TABLE domain_flag AS
SELECT t1.url,
       CASE WHEN t2.ug_f1 >0 THEN 1
       ELSE 0
       END
       AS auto_flag 
FROM main_table AS t1 
    INNER JOIN
    main_table_s3 AS t2
    ON t1.uid = t2.uid;


EOF