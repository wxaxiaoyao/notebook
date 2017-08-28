## lua教程

### 环境安装
	curl -R -O http://www.lua.org/ftp/lua-5.3.0.tar.gz
	tar zxf lua-5.3.0.tar.gz
	cd lua-5.3.0
	make linux test
	make install


### 1 注释
单行注释--: `-- single line comment`  
多行注释--[[  --]]: `--[[ multi line comment --]]`


### 2 变量
变量：默认是全局变量

## 常见问题
### ipairs 与 pairs
>ipairs:遍历数组  
>pairs:遍历所有元素

### table方法调用使用.和:的区别 
>用.定义方法时object.func_name(arg1,arg2...)，方法真正的函数签名形式为: object.func_name(arg1, arg2...)  
>用:定义方法时object:func_name(arg1,arg2...)，方法真正的函数签名形式为: object:func_name(self, arg1, arg2...) 
>
>使用.调用方法时object.func_name(arg1,arg2...)，真正调用方式为：object.func_name(arg1,arg2...)  
>使用:调用方法时object:func_name(arg1,arg2...)，真正调用方式为：object:func_name(self, arg1,arg2...)  
>
>定义: object.func_name(arg1,arg2...)  
>调用: object.func_name(arg1,arg2...)  
>
>定义: object:func_name(arg1,arg2...)  
>调用: object.func_name(object, arg1,arg2...) 或 object:func_name(arg1,arg2...)  
>
> 代码示例:
>
	function inherit(base, derive)
	    derive = derive or {}
> 
	    if type(base) == "table" then
	        setmetatable(derive, base)
	        base.__index = base
	        derive._super = base
	    end 
>
	    return derive
	end
>	
	local base = {x=1}
>	
	function base:print()
	    print("base class", self.y)
	end
>	
	local derive = inherit(base,{y=2})
	function derive:print() 
	    print("derive class")
	end
>	
	function derive:test()
	    self._super:print()      -- base class nil
	    self._super.print(self)  -- base class 2
	    self.print()             -- derive class
	end
>	
	derive:test()


### lua模块包管理器安装
>sudo apt-get install luarcoks

### 装mysql库
>sudo apt-get install lua-sql-msyql-dev


### 字符串
	
	-- 单引号
	'hello world'
	-- 双引号
	"hello world"
	-- 下面为多行字符串表示方法
	[[                           
		hello
		world
	]]

### 3 循环	
	while(condition)
	do
	   statements
	end
	
	for var=exp1,exp2,exp3 do    for i=1, 10, 1 do  
    	<执行体>  					print(i)
	end  						 end
	
	for i, v in ipairs(a) do
		print(v)
	end 

	repeat	
		statements
	until (condition)   -- condition 为真结束循环
	# break return只能为语句块的尾部  do return  end 


## 常用API
	
	tonumber("12")   -- 字符串转数字
	print("10" + 1)  --> 11   -- 隐式转换 

	tostring(12)     -- 数字转字符串
	print(10 .. 10)  --> 1010  -- 隐式转换 注意第一个数字后需要有空格 

	rawget(table, index) --> 获取表指定字段，若不存在返回nil, 不会触发元方法index
	rawset(table, key, value) --> 直接表字段赋值 绕过newindex元方法	

##知识链接  
*[lua正则博客](http://www.cnblogs.com/meamin9/p/4502461.html)



## lua luarocks安装
```
wget https://luarocks.org/releases/luarocks-2.4.1.tar.gz
tar -zxvf luarocks-2.4.1.tar.gz
cd luarocks-2.4.1
./configure --lua-suffix=jit --with-lua-include=/usr/local/include/luajit-2.0
sudo make bootstrap
```

### lua mysql
```
whereis mysql   # 查看include目录
luarocks install luasql-mysql MYSQL_INCDIR=/usr/include/mysql  # MYSQL_INCDIR为上步查询目录
```
### nginx_lua环境搭建
>搭建nginx lua环境,其实是nginx能够解释执行lua. 因为需源编译安装nginx同时需将lua解释器链接进去.具体步骤如下:   

1 下载如下4个安装包,并将解压目录放于/ngx_lua目录下 (/ngx_lua目录可更换 解压命令tar -xzvf xxx.tar.gz)
[nginx-1.13.4.tar.gz](http://nginx.org/download/nginx-1.13.4.tar.gz)
[luajit-2.0.5.tar.gz](http://luajit.org/download/LuaJIT-2.0.5.tar.gz)
[ngx_devel_kit-0.3.0.tar.gz](https://codeload.github.com/simpl/ngx_devel_kit/tar.gz/v0.3.0)
[lua-nginx-module-0.10.10.tar.gz](https://codeload.github.com/openresty/lua-nginx-module/tar.gz/v0.10.10)

2 源码安装luajit 并导出luajit库和头文件的环境变量
```
# 安装luajit    
cd /ngx_lua/LuaJIT-2.0.5
make 
make install
# lib和include是默认放在/usr/local/lib和usr/local/include
# 导出环境变量
export LUAJIT_LIB=/usr/local/lib    
export LUAJIT_INC=/usr/local/include/luajit-2.0  
```
   
3 源码安装nginx
```
cd /ngx_lua/nginx-1.13.4
./configure --prefix=/nginx --with-ld-opt="-L /usr/local/lib" --add-module=/ngx_lua/ngx_devel_kit-0.3.0 --add-module=/ngx_lua/lua-nginx-module-0.10.10
# --add-module="为module源码目录"
# 若缺库可尝试安装对应的库即可
# apt-get -qq -y install libpcre3
# apt-get -qq -y install libpcre3-dev
# apt-get -qq -y install zlib1g-dev
# apt-get -qq -y install libssl-dev
make -j2
make install
```

4 验证安装
```
cd /nginx/conf; vim nginx.conf  # 编辑nginx配置文件, 添加如下内容:
location /hello { 
default_type 'text/plain'; 
content_by_lua 'ngx.say("hello, lua")'; 
}
# 启动nginx
/nginx/sbin/nginx
# 访问localhost/hello  返回hello lua页面内容
```

5 参考
* [http://www.cnblogs.com/yjf512/archive/2012/03/27/2419577.html](http://www.cnblogs.com/yjf512/archive/2012/03/27/2419577.html)
* [https://github.com/openresty/lua-nginx-module#installation](https://github.com/openresty/lua-nginx-module#installation)
* [linux动态加载方式](http://blog.csdn.net/pa5201314/article/details/44876931)
* [nginx configure参数解析](http://www.cnblogs.com/felixzh/p/6283791.html)


## luarocks 常用库
* luarocks install lua-resty-http   # http 客户端
* luarocks install lua-cjson      # json 编码

## nginx lua 开发教程
[nginx开发入门到精通](http://tengine.taobao.org/book/)
[http://jinnianshilongnian.iteye.com/blog/2186448](http://jinnianshilongnian.iteye.com/blog/2186448)


[lua博客教程](http://www.cnblogs.com/stephen-liu74/archive/2012/07/30/2487201.html)