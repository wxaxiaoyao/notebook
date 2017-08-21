-- 设置模块路径
--package.path=package.path .. [[;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/lib/lua/5.1/?.lua;/usr/local/lib/lua/5.1/?/init.lua;/usr/share/lua/5.1/?.lua;/usr/share/lua/5.1/?/init.lua;./?.lua]]
--package.cpath=package.cpath .. [[;/usr/local/lib/lua/5.1/?.so;/usr/lib/x86_64-linux-gnu/lua/5.1/?.so;/usr/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so;./?.so]]

local cjson = require "cjson"

--- 继承
function inherit(baseClass, newClass)
	if baseClass and type(baseClass) ~= "table" then
		--log("base class type error")
		return
	end

	baseClass = baseClass or {}
	newClass = newClass or {}

	setmetatable(newClass, baseClass)
	baseClass.__index = baseClass
	newClass._super = baseClass


	return newClass
end

-- 获取表
function gettable(name, rootTable)
	if not name then return end

	local t = rootTable or _G
	
	for w, d in string.gmatch(name, "([%w_]+)(.?)") do
		t[w] = t[w] or {}
		t = t[w]
	end
	
	return t
end


-- json
function toJson(t)
	print(cjson.encode({key="test"}))
end


toJson()
