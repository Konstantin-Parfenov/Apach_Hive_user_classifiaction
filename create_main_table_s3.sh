beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;


CREATE EXTERNAL TABLE main_table_s3
(
    uid bigint,
    ug_f1 int,
    ug_f2 int,
    ug_f3 int,
    ug_f4 int
)
row format delimited
fields terminated by '\t'
location '/user/konstantin.parfenov/lab03result';

LOAD DATA INPATH '/user/konstantin.parfenov/lab03result' INTO TABLE main_table_s3;

EOF