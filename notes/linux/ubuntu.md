

## 新装系统
1. sudo passwed root  # 修改root密码
2. 更改软件更新频率(默认每日更新, 会占用apt命令)
3. 更新数据源  /etc/apt/source.list
4. sudo apt-get install openssh-server     # 安装ssh 服务程序  
5. sudo apt-get install vim                # 安装vim

## apt-get 
### 设置代理
```bash
# 临时有效
sudo apt-get -o Acquire::http::proxy="http://www:1234567@192.168.0.200:8282/" install jq
# 持久生效
vim /etc/apt/apt.conf 添加如下内容
Acquire::http::proxy "http://www:1234567@192.168.0.200:8282/";
Acquire::ftp::proxy "http://www:1234567@192.168.0.200:8282/";
Acquire::https::proxy "http://www:1234567@192.168.0.200:8282/";
```

### 安装包目录
`/var/cache/apt/archives`

