linux java jdk配置
---
1 下载在压缩包解压到`/usr/local/java`  
2 配置如下环境变量:  

* export JAVA_HOME=/usr/local/java/jdk1.7.0_45  
* export JRE_HOME=/usr/local/java/jdk1.7.0_45/jre
* export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib:$CLASSPATH
* export PATH=$JAVA_HOME/bin: $PATH


