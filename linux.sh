
# 设置管理员密码
#sudo passwd root
#******

#apt-get install -qq -y vim
#apt-get install -qq -y git
#apt-get install -qq -y openssh-server

# git config
#git config --global user.email "765485868@qq.com"
#git config --global user.name "xiaoyao"

# root ssh login
#vim /etc/ssh/sshd_config
#root登录: PermitRootLogin yes
#密码登录: PasswordAuthentication yes
#service ssh restart

# 下载笔记
#cd
#mkdir workspace
#cd workspace
#git clone git@github.com:wxaxiaoyao/notebook.git

# 搭建vim环境
#cd
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim # 安装vim管理插件
#ln -s ~/workspace/notebook/vim/vimrc ~/.vimrc # 连接vimrc文件
#vim +PluginInstall +qall  # 安装vim插件

# ngx lua env
#mkdir -p /ngx_lua
#cd /ngx_lua
# 下载安装包
# wget https://raw.githubusercontent.com/wxaxiaoyao/notebook/master/software/nginx-1.13.4.tar.gz 
# wget https://raw.githubusercontent.com/wxaxiaoyao/notebook/master/software/ngx_devel_kit-0.3.0.tar.gz 
# wget https://raw.githubusercontent.com/wxaxiaoyao/notebook/master/software/lua-nginx-module-0.10.10.tar.gz 
# wget https://raw.githubusercontent.com/wxaxiaoyao/notebook/master/software/LuaJIT-2.0.5.tar.gz 
# 解压
#tar -zxvf nginx-1.13.4.tar.gz
#tar -zxvf ngx_devel_kit-0.3.0.tar.gz
#tar -zxvf lua-nginx-module-0.10.10.tar.gz
#tar -zxvf LuaJIT-2.0.5.tar.gz
# 安装luajit
#cd /ngx_lua/LuaJIT-2.0.5
#make 
#make install
#export LUAJIT_LIB=/usr/local/lib    
#export LUAJIT_INC=/usr/local/include/luajit-2.0
# 安装nginx
#apt-get install -qq -y libpcre3 
#apt-get install -qq -y libpcre3-dev 
#apt-get install -qq -y zlib1g-dev 
#apt-get install -qq -y libssl-dev

#cd /ngx_lua/nginx-1.13.4
#./configure --prefix=/nginx --with-ld-opt="-L /usr/local/lib" --add-module=/ngx_lua/ngx_devel_kit-0.3.0 --add-module=/ngx_lua/lua-nginx-module-0.10.10
#make j2
#make install
# 添加nginx到环境变量
#echo 'PATH=/nginx/sbin:$PATH' >> ~/.profile


# 安装luarocks
#mkdir -p ~/workspace/software
#cd ~/workspace/software
#wget https://raw.githubusercontent.com/wxaxiaoyao/notebook/master/software/luarocks-2.4.1.tar.gz
#tar -zxvf luarocks-2.4.1.tar.gz
#cd luarocks-2.4.1
#./configure --lua-suffix=jit --with-lua-include=/usr/local/include/luajit-2.0
#make bootstrap

# mysql 安装

# lua 常用库
#luarocks install luasql-mysql MYSQL_INCDIR=/usr/include/mysql
luarocks install lualogging
luarocks install lua-cjson
luarocks install luajwt
luarocks install lua-resty-template
