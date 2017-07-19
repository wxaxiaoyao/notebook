### string常用操作
	var str = 'hello world';
	//取指定位置的值
	console.log(str[0]);              // h
	console.log(str.charAt(0));       // h
	
	//给指定位置赋值  将1的e改为o
	console.log(str.substr(0,1) + 'o' + str.substr(2,str.length));  // hollo world
	// 写成函数
	function assignAt(str, pos, value) {
	    if (pos < 0 || pos >= str.length) {
	        return str;
	    }   
	    return str.substr(0,pos) + value + str.substr(pos+1, str.length);
	}
	console.log(assignAt(str,1,'o'));  // hollo world

### 去掉字符串两端空格 
	str = str.replace(/(^\s*)|(\s*$)/g, "");
	
[js String对象API手册](http://www.w3school.com.cn/jsref/jsref_obj_string.asp)



#### 字符串转数字
	parseInt("22");