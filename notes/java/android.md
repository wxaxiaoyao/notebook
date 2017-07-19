android studio环境搭建
--
1. 下载JDK(http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
      Android Studio(https://dl.google.com/dl/android/studio/install/1.4.0.10/android-studio-bundle-141.2288178-windows.exe)  
2. 安装JDK(根据提示一次点击即可)                 // 安装目录：install_dir
3. 配置JDK环境变量：  
		
		JAVA_HOME = install_dir
		CLASSPATH = .;%JAVA_HOME%\lib;%JAVA_HOME%\lib\tools.jar
		PATH = %JAVA_HOME%\bin;%JAVA_HOME%\jre\bin   // path环境变量一般存在，直接在尾部添加即可，注意；隔开
4. 测试，进入win命令行窗口执行java,javac应有相应使用信息打印
5. 安装Android Studio(根据提示一次点击即可)
6. 启动android studio并建立项目
>
android studio启动失败：  
>
1. 提示jdk，环境变量等问题可能jdk安装及环境设置有问题  
2. android sdk更新失败(下载Android Studio时下个自带SDK的可避免此情况发生)，则  
	1. 在安装目录install_dir下bin/idea.properties(idea开头类似的配置文件)文件最后一行:disable.android.first.run=true  
	2. 下载android sdk并安装 
	3. 再启动android studio选择：configue->Project Defaults->Project Structure配置框配置SDK或JDK相关安装目录(设置好后，config界面的SDK Manager会由灰变亮)  

android模拟器
--
连接模拟器：adb.exe connect 127.0.0.1:62001  
向模拟器发送菜单键:adb shell input keyevent 82