beeline <<EOF  jdbc:hive2://spark-node2.newprolab.com:10000 -n konstantin.parfenov -p ZFLm7AA
use konstantin_parfenov;
show tables;

INSERT OVERWRITE DIRECTORY 'hdfs://spark-master.newprolab.com:8020/user/konstantin.parfenov/lab03result'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE

select

uid,

CASE 
    WHEN summary_groups.sum_ucf_1_1 >=10 then 1
    WHEN summary_groups.sum_ucf_1_2 >=10 then 1
    WHEN summary_groups.sum_ucf_1_3 >=10 then 1
    ELSE 0
END AS user_cat1_flag,

CASE 
    WHEN summary_groups.sum_ucf_2_1 >=10 then 1
    WHEN summary_groups.sum_ucf_2_2 >=10 then 1
    WHEN summary_groups.sum_ucf_2_3 >=10 then 1
    ELSE 0
END AS user_cat2_flag,

CASE 
    WHEN summary_groups.sum_ucf_3_1 >=10 then 1
    WHEN summary_groups.sum_ucf_3_2 >=10 then 1
    WHEN summary_groups.sum_ucf_3_3 >=10 then 1
    ELSE 0
END AS user_cat3_flag,

CASE 
    WHEN summary_groups.sum_ucf_4_1 >=10 then 1
    WHEN summary_groups.sum_ucf_4_2 >=10 then 1
    WHEN summary_groups.sum_ucf_4_3 >=10 then 1
    ELSE 0
END AS user_cat4_flag

FROM 
(select
    uid,

    sum(CASE WHEN url IN ('cars.ru') then 1 
        else 0 
        end)
        as sum_ucf_1_1,

    sum(CASE WHEN url IN ('avto-russia.ru') then 1 
        else 0 
        end)
        as sum_ucf_1_2,

    sum(CASE WHEN url IN ('bmwclub.ru') then 1 
        else 0 
        end)
        as sum_ucf_1_3,

    sum(CASE WHEN url IN ('postnauka.ru') then 1 
        else 0 
        end)
        as sum_ucf_2_1,

    sum(CASE WHEN url IN ('plantarium.ru') then 1 
        else 0 
        end)
        as sum_ucf_2_2,

    sum(CASE WHEN url IN ('lensart.ru') then 1 
        else 0 
        end)
        as sum_ucf_2_3,        

    sum(CASE WHEN url IN ('pass.rzd.ru') then 1 
        else 0 
        end)
        as sum_ucf_3_1,

    sum(CASE WHEN url IN ('rzd.ru') then 1 
        else 0 
        end)
        as sum_ucf_3_2,

    sum(CASE WHEN url IN ('vokrug.tv') then 1 
        else 0 
        end)
        as sum_ucf_3_3,

    sum(CASE WHEN url IN ('apteka.ru') then 1 
        else 0 
        end) 
        as sum_ucf_4_1,

    sum(CASE WHEN url IN ('doctor.ufacity.info') then 1 
        else 0 
        end) 
        as sum_ucf_4_2,

    sum(CASE WHEN url IN ('womanhit.ru') then 1 
        else 0 
        end) 
        as sum_ucf_4_3

FROM main_table

GROUP BY uid ) as summary_groups;

EOF