# lua MYSQL编程 

## 环境搭建
	#mysql 安装
	sudo apt-get install mysql-server mysql-client     
	# lua mysql 开发驱动安装
	sudo apt-get install lua-sql-msyql-dev

## 使用案例
	-- 打开相关对象
	local mysqlDriver = require "luasql.mysql"   -- 获取驱动对象driver
	local env = mysqlDriver.mysql()              -- 构建环境对象
	local conn = env:connect("test", "root", "******")  -- mysql 接连对象
	-- 通过conn:execute执行sql语句，当执行非查询语句返回影响行和错误字符串, 当执行查询语句时返回光标对象和错误字符串
	-- 执行非查询语句
	local status, err = conn:execute([[insert into user values(NULL,"xuejian", "F")]])
	-- 执行查询语句
	local cursor, err = conn:execute([[select * from user]])
	local row = cursor:fetch({}, 'a')            -- 第一个参数放个表对象，用于获取值， 第二个参数表示存值方式 a -- 字典 n -- 数组
	while row do
		row = cursor:fetch(row, 'a')             -- 当取完记录再取，cursor对象自动关闭并放回nil
	end 
	-- 关闭相关对象
	cursor:close()
	conn:close()
	env:close()

## 参考链接
[luasql 官方教程](http://keplerproject.github.io/luasql/manual.html#mysql_extensions)