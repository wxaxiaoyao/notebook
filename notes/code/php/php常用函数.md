####字符串与数字互转:
	1. $intNum = (int)$strNum;             // 强制转换 其它类型int, float, string
	2. $intNum = intval($strNum);          // 函数转换 其它函数:intval, floatval, strval
	3. $bSuccess = settype($strNum,'int'); // 类型转换   $bSuccess 类型转换是否成功， 成功strNum变成intNum 


####打印输出:
	1. echo                                #输出多个字符串
	2. print                               #输出一个字符串
	3. die                                 #输出并中止
	4. printf                              #格式化输出
	5. print_r                             #输出一个变量 类型任意
	6. var_dump                            #输出变量全部信息
	7. var_export                          #类似var_dump但结果可以获取

