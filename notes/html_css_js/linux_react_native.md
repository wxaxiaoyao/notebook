linux react-native 环境搭建
--
1. 官方下载压缩包，并将压缩包中的bin目录配置到PATH路径([node官方下载地址](https://nodejs.org/en/download/))

2. 配置nodejs的淘宝源:`npm install -g cnpm --registry=https://registry.npm.taobao.org`

3. 升级C++Builder(不升级npm install相关模块编译会报错,若没有相关错误可不升级)：
		
		rpm -ivh https://www.softwarecollections.org/en/scls/rhscl/devtoolset-3/epel-6-x86_64/download/rhscl-devtoolset-3-epel-6-x86_64.noarch.rpm

		yum install devtoolset-3-gcc-c++
		
		scl enable devtoolset-3 bash  //临时使用最新版gcc
		
		echo "source /opt/rh/devtoolset-3/enable" >>/etc/profile  //系统默认使用gcc-4.9

4. 安装react-native命令:`npm install -g react-native-cli`

5. 验证:

		react-native init test 
		cd test && react-native run-android  // 编译安装test APP.apk
		npm start                            // 开启代码服务器 
		//ps:若程序出现连接相关错误，请设置代码服务器的地址即可



