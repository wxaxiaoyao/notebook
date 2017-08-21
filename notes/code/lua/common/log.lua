--luarocks install lualogging

local logging = require "logging"
local logging.console = require "console"
local logging.file = require "logging.file"


local logger = logging.file("test%s.log", "%Y-%m-%d")

local log = {
	-- 默认配置
	config = {
		console = {

		}
	}
}


-- 创建日志对象
function log.new(self, config)
	local logger = {}
	setmetatable(logger, {__index=self})
	logger.config = config

	return logger
end

