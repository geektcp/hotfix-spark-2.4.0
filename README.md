# hotfix-spark-2.4.0
```
修改spark-sql_2.11-2.4.0-cdh6.2.0的源码
解决spark-2.4.0不支持流式抽取mysql数据源数据的问题
```

# usage
```
step 1:
cd /tmp
git clone https://github.com/geektcp/hotfix-spark-2.4.0.git

step 2:
open this project with intelJ idea
then run the intelJ idea button Build or use shortcut keys: CTRL+F9
```

# result
```
u can see the class at this:
/tmp/hotfix-spark-2.4.0/target/classes/org/apache/spark/sql/execution/datasources/jdbc

$ ls -l
total 108
-rw-r--r-- 1 Administrator 197121  1810 Apr  7 19:04 'JDBCOptions$$anonfun$1.class'
-rw-r--r-- 1 Administrator 197121  2525 Apr  7 19:04 'JDBCOptions$$anonfun$10.class'
-rw-r--r-- 1 Administrator 197121  1102 Apr  7 19:04 'JDBCOptions$$anonfun$11.class'
-rw-r--r-- 1 Administrator 197121  1106 Apr  7 19:04 'JDBCOptions$$anonfun$12.class'
-rw-r--r-- 1 Administrator 197121  1559 Apr  7 19:04 'JDBCOptions$$anonfun$13.class'
-rw-r--r-- 1 Administrator 197121  1101 Apr  7 19:04 'JDBCOptions$$anonfun$14.class'
-rw-r--r-- 1 Administrator 197121  1105 Apr  7 19:04 'JDBCOptions$$anonfun$15.class'
-rw-r--r-- 1 Administrator 197121  2196 Apr  7 19:04 'JDBCOptions$$anonfun$16.class'
-rw-r--r-- 1 Administrator 197121  1117 Apr  7 19:04 'JDBCOptions$$anonfun$17.class'
-rw-r--r-- 1 Administrator 197121  1105 Apr  7 19:04 'JDBCOptions$$anonfun$18.class'
-rw-r--r-- 1 Administrator 197121  1833 Apr  7 19:04 'JDBCOptions$$anonfun$2.class'
-rw-r--r-- 1 Administrator 197121  1810 Apr  7 19:04 'JDBCOptions$$anonfun$3.class'
-rw-r--r-- 1 Administrator 197121  1766 Apr  7 19:04 'JDBCOptions$$anonfun$4.class'
-rw-r--r-- 1 Administrator 197121  1502 Apr  7 19:04 'JDBCOptions$$anonfun$5.class'
-rw-r--r-- 1 Administrator 197121  1382 Apr  7 19:04 'JDBCOptions$$anonfun$6.class'
-rw-r--r-- 1 Administrator 197121  1553 Apr  7 19:04 'JDBCOptions$$anonfun$7.class'
-rw-r--r-- 1 Administrator 197121  1100 Apr  7 19:04 'JDBCOptions$$anonfun$8.class'
-rw-r--r-- 1 Administrator 197121  2359 Apr  7 19:04 'JDBCOptions$$anonfun$9.class'
-rw-r--r-- 1 Administrator 197121  4680 Apr  7 19:04 'JDBCOptions$.class'
-rw-r--r-- 1 Administrator 197121 16661 Apr  7 19:04  JDBCOptions.class
-rw-r--r-- 1 Administrator 197121  2109 Apr  7 19:04 'JdbcOptionsInWrite$$anonfun$19.class'
-rw-r--r-- 1 Administrator 197121  3977 Apr  7 19:04  JdbcOptionsInWrite.class

```

### 有效更新到spark集群
step 1:
cd /opt/cloudera/parcels/CDH-6.2.0-1.cdh6.2.0.p0.967373/lib/spark/jars/
没改源码的md5值
md5sum  spark-sql_2.11-2.4.0-cdh6.2.0.jar
144188a2b10334f5afbaa5a35c8b69d5  spark-sql_2.11-2.4.0-cdh6.2.0.jar

没改源码时，源码里面的JDBCOptions.class的md5值
jar -xvf spark-sql_2.11-2.4.0-cdh6.2.0.jar org/apache/spark/sql/execution/datasources/jdbc/JDBCOptions.class
md5sum org/apache/spark/sql/execution/datasources/jdbc/JDBCOptions.class
3f8956a6f3377f5098f4cf0a6a4d7c2b  org/apache/spark/sql/execution/datasources/jdbc/JDBCOptions.class

step 2:
复制class到特定目录
cd /opt/cloudera/parcels/CDH-6.2.0-1.cdh6.2.0.p0.967373/lib/spark/jars/
cp /tmp/hotfix-spark-2.4.0/target/classes/org/apache/spark/sql/execution/datasources/jdbc/*.class \
/org/apache/spark/sql/execution/datasources/jdbc/

改了源码的class：
ac9242cc390ae500778a57e1a6059b13
/tmp/hotfix-spark-2.4.0/target/classes/org/apache/spark/sql/execution/datasources/jdbc/JDBCOptions.class

step 3:
打包进对应的spark jar里面
jar -uvf spark-sql_2.11-2.4.0-cdh6.2.0.jar org/apache/spark/sql/execution/datasources/jdbc
修改源码后的jar：
[root@sit-getech-hr-4 test_jar]# md5sum spark-sql_2.11-2.4.0-cdh6.2.0.jar
35ba95383a8497b5185c4d6550d8d5ef  spark-sql_2.11-2.4.0-cdh6.2.0.jar

step 4:
将这个spark-sql_2.11-2.4.0-cdh6.2.0.jar同步到其他spark节点上。
