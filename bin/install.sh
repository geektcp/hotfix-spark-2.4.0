#!/bin/sh
# date: Mon Apr 17 15:32:36 CST 2023
# author: Mr.Tang

HDFS_JAR_HOTFIX=hdfs:///tmp/jar/hotfix/spark-sql_2.11-2.4.0-cdh6.2.0.jar
SPARK_JAR=/opt/cloudera/parcels/CDH-6.2.0-1.cdh6.2.0.p0.967373/jars/spark-sql_2.11-2.4.0-cdh6.2.0.jar
SPARK_JAR_NAME=spark-sql_2.11-2.4.0-cdh6.2.0.jar

if [ -f ${SPARK_JAR} ];then
    echo "${SPARK_JAR} exist"
    md5sum ${SPARK_JAR}
	rm -rf ${SPARK_JAR}
else
    echo "${SPARK_JAR} not exist"
    exit 10
fi

rm -rf ./${SPARK_JAR_NAME}
hadoop fs -get ${HDFS_JAR_HOTFIX}
mv ./${SPARK_JAR_NAME} ${SPARK_JAR}
md5sum ${SPARK_JAR}

