#!/bin/sh

INSTALL_DIR=/root/sparkjar
INSTALL_DIR_RAW=${INSTALL_DIR}/raw
INSTALL_DIR_HOTFIX=${INSTALL_DIR}/hotfix
SPARK_JAR_DIR=/opt/cloudera/parcels/CDH-6.2.0-1.cdh6.2.0.p0.967373/jars
SPARK_JAR_NAME=spark-sql_2.11-2.4.0-cdh6.2.0.jar
HDFS_JAR_PATH=hdfs:///tmp/jar/hotfix/spark-sql_2.11-2.4.0-cdh6.2.0.jar
BACKUP-SEQ=`date "+%Y.%m.%d-%H.%M.%S"`

mkdir -p ${INSTALL_DIR_RAW}
mkdir -p ${INSTALL_DIR_HOTFIX}

mv ${SPARK_JAR_DIR}/${SPARK_JAR_NAME} ${INSTALL_DIR_RAW}/${SPARK_JAR_NAME}--BACKUP-SEQ
md5sum ${INSTALL_DIR_RAW}/${SPARK_JAR_NAME}
mkdir -p ${INSTALL_DIR_HOTFIX}
cd ${INSTALL_DIR_HOTFIX}
hadoop fs -get ${HDFS_JAR_PATH} ${SPARK_JAR_NAME}--BACKUP-SEQ

if [ -f ${SPARK_JAR_DIR}/${SPARK_JAR_NAME} ];then
    echo "${INSTALL_DIR_RAW}/${SPARK_JAR_NAME} exist"
	exit 20
fi

cp ${INSTALL_DIR_HOTFIX}/${SPARK_JAR_NAME}--BACKUP-SEQ ${SPARK_JAR_DIR}/${SPARK_JAR_NAME}
md5sum ${SPARK_JAR_DIR}/${SPARK_JAR_NAME}

