beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;


CREATE EXTERNAL TABLE main_table
(
    uid bigint,
    url string,
    ts bigint
)
row format delimited
fields terminated by '\t'
location '/user/konstantin.parfenov/lab_3_filtered';

LOAD DATA INPATH '/user/konstantin.parfenov/lab_3_filtered' INTO TABLE main_table;

EOF