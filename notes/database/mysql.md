#### 常用命令
	mysql -h 主机 -u 用户 -P 端口 -D 数据库名 -p 密码                    // 登录，注意-p后接密码有空格时表示在交互输入，没有空格则直接在命令中包含密码即可
	create database dbname                                            // 创建数据库
	show databases                                                    // 显示数据库   show tables 显示表
	show create table table_name                                      // 显示建表语句
	source script.sql                                                 // 执行sql脚本

#### 修改root密码
	1. set password for 'root'@'localhost' = password('new_passwd');     // 该root密码
	2. mysqladmin -u root password "newpass" -p
	3. use mysql;UPDATE user SET Password = PASSWORD('newpass') WHERE user = 'root'; FLUSH PRIVILEGES;  
	ps:忘记root密码，先在my.cnf配置文件中[mysqld]中添加skip-grant-tables 重起mysqld 再使用方式3修改密码

#### 时间查询
	select * from table_name where time_field = '2015-09-21 15:04:05';  // 准确查找某个时刻的记录
	select * from table_name where date(time_field) = '2015-09-21';     // 查找某个日期的函数 

#### mysql优化
	set bulk_insert_buffer_size = 100000                                // 插入优化
 
#### 重装mysql
	sudo apt-get autoremove --purge mysql-server-5.5
	sudo apt-get autoremove mysql-client
	sudo apt-get autoremove mysql-server
	sudo apt-get autoremove mysql-common
	sudo apt-get install mysql-server mysql-client

##### 远程访问mysql授权
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;   #root <=> username % <=> host
	FLUSH PRIVILEGES; 

#### 数据库导出
	mysqldump -uroot -ppassword db_name > out_file.sql

#### mysql升级导致问题可执行如下命令:
	mysql_upgrade -u root -p

### install 
```bash
apt-get install mariadb-server mariadb-client libmysqlclient-dev  # 安装
service mysql restart       # 重启
mysqladmin -u root password "new_password"; 
GRANT ALL PRIVILEGES ON *.* TO 'wuxiangan'@'%' IDENTIFIED BY 'wuxiangan' WITH GRANT OPTION; # 客户端登录
vim /etc/mysql/mariadb.conf.d/50-server.cnf # 屏蔽bind-address=127.0.01行, 允许客户端连接 
```