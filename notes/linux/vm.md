#### 制作vagrant base box
--
**前置条件:**  
1. 安装VirtualBox  
2. 安装Vagrant  
3. 在VirtualBox中安装操作系统，例如 CentOS  
**方法:**
1. 创建vagrant用户和用户目录，密码为vagrant  
2. 添加vagrant用户的公共密钥，文件为/home/vagrant/.ssh/authorized_keys  
3. 在真实操作系统中执行vagrant package --base 虚拟机名称，这样会创建指定虚拟机的box  
4. 将制作好的Box添加到Vagrant环境中，vagrant box add name package.box  
5. 初始化运行环境,vagrant init name  
6. 运行Vagrant虚拟机，vagrant up


####vbox 显示模式
right_ctrl+c     自动缩放  
right_ctrl_home  显示菜单  