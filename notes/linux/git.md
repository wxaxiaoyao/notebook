git config 配置
--
设置用户标识

	git config --global user.name "wxa"
	git config --global user.email "wxa@xxx"

设置远程用户标识存贮方式
	
	git config --global credential.helper store    //记住
	git config --global credential.helper cache    //缓存
	git config credential.helper 'cache --timeout=3600' //设置缓存时间 单位s

设置push模式  matching

	git config --global push.default matching // 同名push
	git config --global push.default simple   // 当前分支push	
	ps: 当提交修改到远程分支时，先使用pull更新在提交，防止提交出错。

辅助配置
  
	git config --global color.ui true  // 显示命令颜色
	git config --global alias.unstage 'reset HEAD'  // 配置别名   .git/config 配置文件位置

代理配置  

	git config --global http.proxy http://www:1234567@127.0.0.1:8080

忽略跟踪文件.gitignore  
1. 以/结尾表示目录， 仅仅表示目录自身，不包含其子项  
2. 支持统配符：* 0个或多个字符  ? 单个字符  [] 单个字符的匹配列表  
3. !开头不忽略(跟踪)匹配到的文件或目录  
注意:  
1. xxx/* 表示以xxx/开头的所有文件，并不是表示xxx目录下的所有项。 首行优先级大于末行  
2. 即时生效，无需提交  
3. 对已添加的无效  


证书认证
--
1. 在客户端执行 ssh-keygen -t rsa                              // 该命令会再$HOME/.ssh目录下生产id_rsa id_rsa.pub两个文件， 根据提示自选目录保存这两个文件
2. scp id_rsa.pub username@server_ip:/$HOME/.ssh             // 将公钥上传到服务器
3. cat $HOME/.ssh/id_rsa.pub >>  $HOME/.ssh/authorized_keys  // 将公钥内容追加到authorized_keys文件中

常用命令
--
	#基本操作
	git add filename...   // 添加文件到暂存区
	git rm  filename...   // 从暂存区删除文件
	git commit [filename] // 提交暂存区文件内容到本地库
	git reset --hard commit_id // 回退到上一个版本 HEAD^上个版本 HEAD^^上上个版本 HEAD~N 上N个版本
	git reset HEAD file...     // 去除索引 即从暂存区移除
	git checkout -- file...    // 撤销修改 优先比较暂存区与本地，若暂存区无，再比较库与本地
	
	
	#分支
	git branch               // 查看当前分支   分支操作使用此命令加选项(-d 删除 —D 可删除未合并分支)
	git checkout <name>      // 切换分支
	git branch <name>        // 创建分支 ps：创建分支都是从当前分支进行克隆
	git checkout -b <name> [start_point]  // 创建并切换分支 相当于 git branch <name>   git checkout <name>
	git merge <name>                      // 合并当前分支与指定分支  --no-ff -m “commit_msg” 为此次合并做提交记录
	git --graph --pretty=oneline --abbrev-commit // 查看分支合并情况
	
	#远程操作
	git clone URL...                // 克隆远程库
	git remote add <name> <url>     // 添加远程库  
	git remote set-url <name> <url> // 设置远程库的url
	git push <repo> <branch>        // 本地库文件上传到远程库中  -u --建立关联 避免总填写库名和分支名-- 
	git push :branch                //删除远程分支 git push :refs/tags/name 删除远程tag
	git tag <name> [commit_id]      // 创建标签  -a 指定标签名 -m 标签描述 -s标签签名 -d删除标签
	git push <repo> <tagname>       // 推送标签   git push origin --tags 推送全部未推送标签
	git fetch origin tag tagname    // 获取远程tag
	git push origin :refs/tags/tagname // 删除远程tag
	
	#辅助操作
	git diff filename        // 对比库文件
	git reflog               // 查看版本命令历史
	git log                  // 查看提交命令历史  git log -p filename
	git stash                // 隐藏工作现场
	git stash pop            // 恢复隐藏并删除  相当于 git stash apply  git stash drop
	git stash list           // 查看隐藏列表  git stash apply stash@{0} 恢复指定隐藏
	git update-index --assume-unchanged <file>  // 如果想在本地忽略某个文件   git update-index --no-assume-unchanged <file>

###ssh key多账号管理:  
1. 生成多个账号的key和pub_key：  
		
		ssh-keygen -t rsa -C "765485868@qq.com"     // -C 为备注   github.com
		ssh-keygen -t rsa -C "wuxiangan@uicare.cn"  // -C 为备注   公司
		//ps 执行上述命令交互时注意填写相关文件的路径,使用默认后者会覆盖前者
2. 开启ssh-agent程序：

		ssh-add -l
		// 命令能列出已管理的ssh-key则ssh-agent已开启，跳过此步
		// 若报Could not open a connection to your authentication agent. 错误，则执行如下命令
		eval `ssh-agent`  // windows
		ssh-agent bash    // linux
		//ps:根据系统类型执行相关命令
3. 添加相关账号的ssh-key私钥：
		
		ssh-add id-rsa-private-key  // id-rsa-private-key为ssh-key的私钥文件，若不在相关目录，填完整路劲即可

4. 配置ssh-key使用：

		touch ~/.ssh/config         // 在家目录下的.ssh目录创建此文件，按如下格式添加相关账号使用方式：
		Host aliasName              // 主机别名，随意
        	HostName github.com     // 代码库域名
			User git                // 固定不变
			IdentityFile ~/.ssh/id-rsa-private-key // IdentityFile指定ssh-key的私钥文件

5. 测试:
		
		ssh -T aliasName             // aliasName 配置文件中的主机别名

6. 参考：  
	[博客](http://yijiebuyi.com/blog/f18d38eb7cfee860c117d629fdb16faf.html)	

git基本使用图解
--
![git基本使用图解](http://image.beekka.com/blog/2014/bg2014061202.jpg)

常见问题
--
1 git clone克隆github远程库无法推送，报请求错误问题？
>
   修改.git/config 中的origin=https://github.com/xxx为origin=https://username@github.com/xxx 中username为个人账号名

2 当克隆的库是使用git init初始化时git push报receive.denyCurrentBranch错误？
>
   配置远程库git config receive.denyCurrentBranch ignore  
   需取推送内容需执行git reset --hard HEAD

3 git支持的网络协议?

	git clone http[s]://example.com/path/to/repo.git/
	git clone ssh://example.com/path/to/repo.git/
	git clone git://example.com/path/to/repo.git/
	git clone /opt/git/project.git 
	git clone file:///opt/git/project.git
	git clone ftp[s]://example.com/path/to/repo.git/
	git clone rsync://example.com/path/to/repo.git/
	SSH协议还有另一种写法。
    $ git clone [user@]example.com:path/to/repo.git/

参考:[http://www.ruanyifeng.com/blog/2014/06/git_remote.html](http://www.ruanyifeng.com/blog/2014/06/git_remote.html)

