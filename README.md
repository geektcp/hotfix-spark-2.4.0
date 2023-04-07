# hotfix-spark-2.4.0
```
修改spark-sql_2.11-2.4.0-cdh6.2.0的源码
解决spark-2.4.0不支持流式抽取mysql数据源数据的问题
```

# usage
```
step 1:
git clone https://github.com/geektcp/hotfix-spark-2.4.0.git

step 2:
open this project with intelJ idea
then run the button Build
```

# result
```
u can see the class at this:
target/classes/org/apache/spark/sql/execution/datasources/jdbc

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

