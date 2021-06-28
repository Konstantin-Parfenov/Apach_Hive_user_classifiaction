beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;

INSERT OVERWRITE DIRECTORY 'hdfs://spark-master.newprolab.com:8020/user/konstantin.parfenov/lab03_s_result'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE

SELECT t1.url, 
       ((t1.pdom_1/6571038)*(t1.pdom_1/6571038))/((t2.pdrive_1/6571038)*(313527/6571038)) as relevance
       FROM pdomain_1 as t1
       INNER JOIN
       pdriver_1 as t2
       ON t1.url = t2.url
       ORDER BY relevance DESC, t1.url ASC
       ;

EOF