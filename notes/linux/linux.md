#### Linux下is not in the sudoers file解决方法
1. `visudo` 
2. 找到如下位置:  
3. 
		## Allow root to run any commands anywhere
		root    ALL=(ALL)       ALL
  		在其下方添加你需增加权限的用户,如：
  		xxxx    ALL=(ALL)       ALL  #xxxx为用户名


#### 更改root密码
	sudo passwd root


#### 添加命令到service中
1. 将命令xxx放与/etc/init.d/目录下
2. 执行 chkconfig xxx on

#### linux java jdk环境变量配置
	export JAVA_HOME=/usr/local/java/jdk1.7.0_45
	export JRE_HOME=/usr/local/java/jdk1.7.0_45/jre
	export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib:$CLASSPATH
	export PATH=$JAVA_HOME/bin: $PATH

#### ubantu网络配置
1. /etc/network/interface   
auto eth0  
iface eth0 inet static  
address 192.168.0.1  
netmask  255.255.255.0  
gateway  192.168.0.1  
dns-nameservers 8.8.8.8  
2. /etc/resolvconf/resolv.conf.d/base  #域名解析文件  
nameserver 202.99.166.4  
resolvconf -v  
3. /etc/init.d/networking restart      #这条命令是重启网卡  

#### ssh免密码
1. ssh-keygen 生成密钥对  
2. ssh-copy-id -i xxx/id_rsa.pub username@hostname   // ssh-copy-id 将key写到远程机器的 ~/.ssh/authorized_key文件中  

#### 多行命令
子命令输入：<<EOF  // EOF可换其它结束标记  

#### 常用命令
lsof -i ip:port   // 查看网络套接字信息  
date -i @second   // 秒转成时间字符串  


#### 磁盘相关操作
fdisk -l          // 查看磁盘信息 分区  
mkfs              // 创建文件系统  
mount             // 挂载文件系统   /etc/fstab编辑此文件开机自动挂载  

#### 打包解包
tar -cvzf xxx.zip file1 file2 ... 打包文件  
tar -xvz xxx.zip  


### 查看系统版本信息
1 cat /proc/version  // kernel版本  
2 uname -r         // kernel版本   
3 cat /etc/issue   // linux版本信息  
4 lsb_release -a   // lsb版本信息  

### 环境变量
1 env 查看环境变量   
2 export 导出环境变量  
3 unset 删除环境变量  


注意事项
--
#### 压缩包
linux压缩包不要在window上解压再用，应直接在linux解压使用。window解压会导致链接文件无法正常使用。

#### cron 定时任务
	crontab -e    #编辑用户crontab文件
	service cron restart #重启cron服务进程生效配置


### apt-get 软件管理器
	apt-get remove                      # 移除软件 但不移除依赖
	apt-get –purge remove               #移除软件且不保留配置文件  但不移除依赖
	apt-get autoremove packagenmae      #移除软件 移除依赖
	apt-get autoclean                   # 移除过期安装包
	apt-get clean                       # 移除所有安装包
	apt-cache                           #查询相关安装包
	
## 常用服务器
	#ssh服务器  
	sudo apt-get install openssh-server
	#mysql
	sudo apt-get instll mysql-server mysql-client

### curl http客户端工具
	-H 头部设置
	-X 方法设置
	-A 用户代理设置
	-b Cookie设置
	-e Referer设置
	--data 参数设置
	
	# POST json数据
	curl -H "Content-Type: application/json" -X POST  --data '{"data":"1"}'  http://127.0.0.1/
	
	# 发邮件
	 curl --url "smtp://smtp.sina.com" --mail-from "wxaxiaoyao@sina.com" --mail-rcpt "765485868@qq.com" --upload-file mail.txt --user "wxaxiaoyao@sina.com:wuxiangan"

## 命令
### 目录切换pushd popd dirs
	dirs -v   #目录栈
	dirs -c   #清空目录栈
	
	pushd dir #将目录dir添加到栈顶 并切换到
	pushd -n dir #将目录dir添加到栈顶下面，不切换目录
	pushd +N  #第N个目录移至栈顶，并切换

	popd      #删除栈顶目录，并切换到新栈顶目录
	popd +N   #删除第N个目录

### find 文件查找
	find dir -name "*.txt"  # 查找txt后缀名的所有文件 区分大小写 *通配任意字符  -name后面不是正则	
	find dir -iname "*.txt"  # 查找txt后缀名的所有文件 不区分大小写 *通配任意字符  -name后面不是正则	

### grep 字符串查找
	--include #指定查找的文件类型
	-r        #递归
	grep -R --include=*.lua "function.*copy.*" .

### dpkg 包管理器
	dpkg -i *.deb

