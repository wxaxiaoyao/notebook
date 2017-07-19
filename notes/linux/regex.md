## 正则表达式
### 1. 符号列表
<table style="border-collapse:collapse;">
<th>元字符</th>
<th>描述</th>
<tr>
<td>\</td>
<td>转义字符，将正则符号转成正常字符</td>
</tr>
<tr>
<td>^</td>
<td>匹配输入字符串的开始位置</td>
</tr>
<tr>
<td>$</td>
<td>匹配输入字符串的结束位置</td>
</tr>
<tr>
<td>*</td>
<td>匹配前面的子表达式任意次<code>zo* 匹配 z, zo, zoo....<code></td>
</tr>
<tr>
<td>+</td>
<td>匹配前面的子表达式一次或多次,等价{1,} <code>zo+ 匹配 zo, zoo....<code></td>
</tr>
<tr>
<td>?</td>
<td>匹配前面的子表达式零次或一次</td>
</tr>
<tr>
<td>{n}</td>
<td>n是一个非负整数。匹配确定的n次</td>
</tr>
<tr>
<td>{n,}</td>
<td>n是一个非负整数。匹配至少n次</td>
</tr>
<tr>
<td>{n,m}</td>
<td>m和n均为非负整数，其中n<=m。最少匹配n次且最多匹配m次</td>
</tr>
<tr>
<td>?</td>
<td>跟在限制符（*,+,?，{n}，{n,}，{n,m}）后面时，匹配模式是非贪婪的</td>
</tr>
<tr>
<td>.</td>
<td>匹配除“\r\n”之外的任何单个字符。要匹配包括“\r\n”在内的任何字符，请使用像“[\s\S]”的模式/td>
</tr>
<tr>
<td>(pattern)</td>
<td>匹配pattern并存储,并多一单独pattern匹配结果，引用存储\n(n=1,2,3...括号出现的顺序),例如:
<pre>
Windows(2000)匹配Windows2000得到Windows2000 2000 
</pre>
</td>
</tr>
<tr>
<td>(?:pattern)</td>
<td>匹配pattern，不存储， 匹配结果中包含pattern，不会多出单独的pattern匹配结果,例如:
<pre>Windows(?:95|98|NT|2000)匹配Windows2000得到：Windows2000</pre></td>
</tr>
<tr>
<td>(?=pattern)</td>
<td>
匹配pattern，不存储， 匹配结果中不包含pattern，不会多出单独的pattern匹配结果,例如:
<pre>indows(?=95|98|NT|2000)匹配Windows2000得到：Windows</pre>
</td>
</tr>
<tr>
<td>(?!pattern)</td>
<td>
同?=pattern, 对pattern匹配取反,例如:
<pre>
Windows(?!95|98|NT|2000)匹配Windows2000得到：null
Windows(?!95|98|NT|2000)匹配Windows32得到：Windows
</pre>
</td>
</tr>
<tr>
<td>(?<=pattern)</td>
<td>同?=pattern, pattern位于左侧,例如:
<pre>(?<=95|98|NT|2000)Windows能匹配2000Windows中的Windows</pre></td>
</tr>
<tr>
<td>(?&lt!pattern)</td>
<td>同?<=pattern, pattern位于左侧并取反,例如:  	
<pre>
(?&lt!95|98|NT|2000)Windows能匹配32Windows中的Windows
(?&lt!95|98|NT|2000)Windows能匹配2000Windows中的null
</pre>
</td>
</tr>
<tr>
<td>x|y</td>
<td>匹配x或y</td>
</tr>
<tr>
<td>[xyz]</td>
<td>字符集合,匹配所包含的任意一个字符</td>
</tr>
<tr>
<td>[^xyz]</td>
<td>负值字符集合,匹配未包含的任意字符</td>
</tr>
<tr>
<td>[a-z]</td>
<td>字符范围,匹配指定范围内的任意字符</td>
</tr>
<tr>
<td>[^a-z]</td>
<td>负值字符范围,匹配任何不在指定范围内的任意字符</td>
</tr>
<tr>
<td>\d</td>
<td>匹配一个数字字符</td>
</tr>
<tr>
<td>\D</td>
<td>匹配一个非数字字符</td>
</tr>
<tr>
<td>\s</td>
<td>匹配任何不可见字符，包括空格、制表符、换页符等等。等价于[ \f\n\r\t\v]</td>
</tr>
<tr>
<td>\S</td>
<td>匹配任何可见字符。等价于[^ \f\n\r\t\v]</td>
</tr>
<tr>
<td>\w</td>
<td>匹配包括下划线的任何单词字符,类似但不等价于[A-Za-z0-9_]</td>
</tr>
<tr>
<td>\W</td>
<td>匹配任何非单词字符,等价于[^A-Za-z0-9_]</td>
</tr>
</table>

### 2 常用示例
1. 验证用户名和密码：/^[a-zA-Z]\w{5,15}$/ 格式：字母开头，字母数字下划线组成6-16位  
2. 验证手机号码：/^1[3|4|5|7|8][0-9]\d{8}$/
3. 验证Email地址：/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/；