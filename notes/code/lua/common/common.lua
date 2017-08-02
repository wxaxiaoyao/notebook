

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
