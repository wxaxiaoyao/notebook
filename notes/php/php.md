
####关键字
this:指向对象  
self:指向类  
parent指向父类  

####魔术方法
[http://www.cnblogs.com/xiaochaohuashengmi/archive/2011/09/22/2185034.html](http://www.cnblogs.com/xiaochaohuashengmi/archive/2011/09/22/2185034.html)

####php源码安装
	#cent os
	#yum install -y gcc gcc-c++  make zlib zlib-devel pcre pcre-devel  libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers
 	yum install libxml2-devel.x86_64
 	yum install  openssl.x86_64 openssl-devel.x86_64 -y
	yum install libcurl.x86_64 libcurl-devel.x86_64 -y
	yum install libjpeg.x86_64 libpng.x86_64 freetype.x86_64 libjpeg-devel.x86_64 libpng-devel.x86_64 freetype-devel.x86_64 -y
 	yum install libjpeg.x86_64 libpng freetype libjpeg-devel libpng-devel freetype-devel -y
 	yum install libmcrypt libmcrypt-devel -y
	# ubantu
	sudo apt-get install libxml2-dev
	sudo apt-get install build-essential
	sudo apt-get install openssl 
	sudo apt-get install libssl-dev 
	sudo apt-get install make
	sudo apt-get install curl
	sudo apt-get install libcurl4-gnutls-dev
	sudo apt-get install libjpeg-dev
	sudo apt-get install libpng-dev
	sudo apt-get install libmcrypt-dev
	sudo apt-get install libreadline6 libreadline6-dev
	sudo apt-get install libfreetype6-dev
	# linux源码安装常规3步走	
	./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm --with-fpm-user=www --with-fpm-group=www --with-mysql=mysqlnd --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-iconv-dir --with-freetype-dir=/usr/local/freetype --with-jpeg-dir --with-png-dir --with-zlib --with-libxml-dir=/usr --enable-xml --disable-rpath --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-optimization --with-curl --enable-mbregex --enable-mbstring --with-mcrypt --enable-ftp --with-gd --enable-gd-native-ttf --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-xmlrpc --enable-zip --enable-soap --with-gettext --disable-fileinfo --enable-opcache --with-iconv=/usr/local
	缺libconv库时，可源码安装该库到/usr/local(--with-iconv指定的位置,库地址:http://www.gnu.org/software/libiconv/) 
 	make && make install
 	cp php.ini-production /app/soft/php/lib/php.ini
 	参考：http://www.cnblogs.com/z-ping/archive/2012/06/18/2553929.html
 	php-fpm配置:http://www.cnblogs.com/argb/p/3604340.html
	//更新rpm源:rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
[参考博客](http://blog.sina.com.cn/s/blog_75a07c3b0101kcwb.html)

####composer安装
	curl -sS https://getcomposer.org/installer | php
	mv composer.phar /usr/local/bin/composer
	composer config -g secure-http false