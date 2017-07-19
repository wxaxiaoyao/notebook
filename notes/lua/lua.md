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
