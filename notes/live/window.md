**本机域名文件:** C:\Windows\System32\drivers\etc\hosts

[vbs脚本教程](http://www.cnblogs.com/BeyondTechnology/archive/2011/01/10/1932440.html)

执行bat脚本不弹dos窗口方法:
>createobject("wscript.shell").run "e:\xiaoyao\filesync.bat",0
>e:\xiaoyao\filesync.bat为目标脚本文件, 0表示后台运行  将上行代码写入vbs文件中即可

####定时任务:控制面板\所有控制面板项\管理工具\任务计划程序

### 远程连接命令
>被控方: 系统->远程设置
>空置方: cmd->mstsc