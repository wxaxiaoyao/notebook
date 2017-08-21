local fmt = {}

-- @function: 打印table的内容，递归
-- @param: tbl 要打印的table
-- @param: level 递归的层数，默认不用传值进来
-- @return: return
function fmt.printTable(obj , level, flag)
    level = level or 0
    local indent_str = ""
    for i = 1, level do
      indent_str = indent_str.."    "
    end
  
    if not flag then
        print(indent_str.."{")
    end
  
    for k,v in pairs(obj) do
        if type(v) == "table" then 
            print(string.format("%s    %s = {", indent_str,tostring(k)))
            fmt.printTable(v, level + 1, true)
        else 
            print(string.format("%s    %s = %s", indent_str,tostring(k), tostring(v)))
        end
    end
    print(indent_str.."}")
end

function fmt.print(obj) 
    if type(obj) == "table" then
        fmt.printTable(obj)
    else
        print(obj)
    end
end


function fmtPrint(s)
	print(s)
end

return fmt
-- PrintTable(x)
