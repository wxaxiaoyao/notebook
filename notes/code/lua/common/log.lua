
local is_init = false          -- 模块是否已初始化
local log_filename = "log.txt" -- 日志文件名
local log_file = nil           -- 日志文件句柄
local line_delimiter = "\n"    -- 换行符

-- 日志输出函数
function log(content)
	if not is_init then		
		return
	end

	log_file:write(content)
	log_file:write("\n")

end

-- 模块初始化
function init() 
	if is_init then
		print("already init!!!")
		return
	end

	log_file = io.open(log_filename, "a")

	if not log_file then
		print("open log file faild!!!")
		return 
	end

	is_init = true

end

-- 模块deinit
function deinit() 
	if not is_init then
		return
	end

	log_file:close()
end

init()


