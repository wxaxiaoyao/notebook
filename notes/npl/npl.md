## 时间 日期
	-- 加载实现文件
	NPL.load("(gl)script/ide/DateTime.lua") 
	local timehelp = commonlib.timehelp
	
	-- 常用处理
	local date, time = timehelp.GetLocalTime() -- 获取当前日期跟时间 date:yyyy-MM-dd 

	-- 日期加减
	local nextDate = timehelp.get_next_date_str(date, -7, "%4d-%2d-%2d) -- arg1:基准日期 arg2：加减天 arg3:输出格式


## TABLE DB
	**_id不能做复合索引
