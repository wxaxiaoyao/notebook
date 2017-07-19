# HTML+CSS基础

## HTML基本知识:
### 1. 标签语法: `<tag>content</tag>`  
### 2. html注释:`<!-- 注释内容 -->`  
### 3. 常用标签:  

	html head body #文件结构标签
	hx             #x=[1,2,3,4,5,6] 标题标签
	strong em      #粗体 斜体
    span           #空标签以提供样式设定
	q              #短引用<==>双引号(")
	blockquote     #长引用
    br             #分行<=>回车效果
	&nbsp;         #空格
    hr             #水平线
	address        #地址标签
	code           #单行代码
	pre            #多行代码
	ul             #无序列表 子标签 li(列表项)
	ol             #有序列表 子标签 li(列表项)  	
	div            #容器标签
	table          #表格 子标签th(表头) tr(行) td(列) caption(表标题)
	a              #链接
	mailto         #email
	img			   #图片
	form           #表单 搭配表签(可单独使用):label input select
	label          #关联标签
	input          #输入
	select         #下拉列表 option(下拉项)
	style          #样式标签
	link           #文件引用标签

## CSS基本知识
### 1. 代码语法:`selector {property:value;} #selector:选择符 property:属性 value:值 ;分割属性值对 如下：`
	p {
		font-size:12px;
		color:red;
		/* 注释 */
	}	
### 2. 代码注释:`/*多行注释*/`
### 3. 用法：
1. 内联式使用,直接复制给标签style属性:`<p style="color:red; font-size:12px">我的字体是红色</p>`
2. 嵌入式使用,使用样式标签:  
		
		<!--样式一般写于head标签--> 
		<style type="text/css">
		span {
			color:red;
		}
		</style>
		<!-- html内容 -->
		<div><span>教程示例</span></div>
3. 外部式使用,样式写在单独文件，使用link标签导入:
	
		#style.css文件
		<style type="text/css">
		span {
			color:red;
		}
		</style>
		#html文件
		<!-- html内容 -->
		<!--link一般写于head标签-->
		<head><link href="***/***/style.css" rel="stylesheet" type="text/css"></head>

**优先级:内联式>嵌入式>外部式**	

### 4. selector选择符(例中样式参照css用法使用)
1. 标签选择器: tag  例: `p {color：red;} <p>示例</p>`
2. 类选择器(.): .className 例： `.red {color:red}  <div class="red">示例</div>` 
3. ID选择器(#): #IDName 例: `#red {} <div id="red">示例</div> `
4. 子选择器(>): selector1>selector2  例: `.red>p {} <div class="red"><p>示例</p></div>`
5. 后代选择器(空格): selector1 selector2  例: `.red p {} <div class="red"><p>示例</p></div>`
6. 通用选择器(*): * 例：`* {} <div>示例</div>`
7. 伪类选择器(:): selector:state 此类特殊常用a标签上的各种状态设置样式 例： `a:hover{} <a>鼠标悬浮于此样式</a>` 
8. 分组选择器(,)： selector1,selector2,selector3... 例 `div, p {}<div class="red"><p>示例</p></div>`

**注意事项:**  
1. 优先级:ID选择器>类选择器>标签选择器   
2. 子标签会继承父标签样式  
3. 最高优先级!important放在属性值之后，分隔符分号之前:**`p {color:red!important;}`

### 5. 常用属性
#### 5.1. 字体

		div {
			font-family:"Microsoft Yahei";      #类型
			font-size:12px;                     #大小
			color:red;                          #红色
			font-weight:bold;                   #粗体
			font-style:italic:                  #斜体 
			line-height:2em;                    #行高  1em=font-size px
			font:12px/1.5em  "宋体",sans-serif;  #缩写  大小/行高 类型
		}
#### 5.2. 排版
		
		div {
			text-decoration:underline;          #下划线
			text-decoration:line-through;       #删除线
			text-indent:2em;                    #缩进		
			letter-spacing:50px;                #中文字间隔、字母间隔
			word-spacing:50px;                  #单词间距设置
			text-align:center;                  #块元素中内容对齐方式 
		}
#### 5.3. 盒模型    
>**盒子模型图:**  
![盒子模型图](http://images.cnblogs.com/cnblogs_com/hfcc/WindowsLiveWriter/myRoaddivcss_C5B4/%E7%9B%92%E5%AD%90%E6%A8%A1%E5%9E%8B_thumb.jpg)

>标签元素分类: 块状元素、内联元素(又叫行内元素)和内联块状元素。  
>1.常用的块状元素有：`<div>、<p>、<h1>...<h6>、<ol>、<ul>、<dl>、<table>、<address>、<blockquote> 、<form>`  
>>1. 每个块级元素都从新的一行开始，并且其后的元素也另起一行  
>>2. 元素的高度、宽度、行高以及顶和底边距都可设置。  
>>3. 元素宽度在不设置的情况下，是它本身父容器的100%（和父元素的宽度一致），除非设定一个宽度。
>
>2.用的内联元素有：`<a>、<span>、<br>、<i>、<em>、<strong>、<label>、<q>、<var>、<cite>、<code>`  
>>1. 其他元素都在一行上
>>2. 元素的高度、宽度及顶部和底部边距不可设置
>>3. 元素的宽度就是它包含的文字或图片的宽度，不可改变
>  
>3.常用的内联块状元素有：`<img>、<input>`  
>>1. 和其他元素都在一行上
>>2. 元素的高度、宽度、行高以及顶和底边距都可设置

		
	div {
		display:block;                      #元素显示分类 block inline inline-block
		border:2px  solid  red;             #边框样式缩写: border-width, border-style, border-color 
		border-bottom:1px solid red;        #单边框
		width:200px;                        #宽
    	height:200px;                       #高 
		padding:20px;                       #填充 缩写 上 右 下 左
    	margin:10px;                        #边距 缩写 上 右 下 左
	}

#### 5.4. 布局模型
>元素三种布局模型：1、流动模型（Flow） 2、浮动模型 (Float) 3、层模型（Layer）  
>1.流动模型（Flow）:*默认的网页布局模式*
>>1. 块状元素都会在所处的包含元素内自上而下按顺序垂直延伸分布
>>2. 内联元素都会在所处的包含元素内从左到右水平分布显示  
>
>2.浮动模型 (Float):  
>>块状元素不会独占一行，根据宽度排列， 且块元素默认宽度为内容宽度  
>
>3.层模型（Layer）:
>>层模型三种形式:1.绝对定位(position: absolute) 2.相对定位(position: relative) 3.固定定位(position: fixed)  
>>1. 绝对定位:相对于其最接近的一个具有定位属性(position: relative)进行偏移,没有时相对body定位  
>>2. 相对定位:相对自己进行偏移定位，**偏移前的位置保留不动（之前空间仍然被占用）**  
>>3. 固定定位:相对视图(屏幕内的网页窗口)进行偏移，**不占据文档流位置**
>>      	
>>**上三种使用left、right、top、bottom属性定位**

	div {
		float;left;                        #浮动模型
		position:absolute;                 #层模型-绝对布局
		left:                              #层模型-左偏移
	}

### 6. 常用技巧
1. 水平居中：
	
		div {
			text-align:center;             #块元素-行内居中(块中内容居中)
			#定宽
			width:200px;
			margin:0px auto;               #块元素自身居中(相对父容器)
			#不定宽
			#方法1： 利用table标签长度自适应性与定宽居中结合实现不定宽居中
			#方法2： 利用display:inline改内联元素，设置父容器tetext-align:center;
			#方法3： 利用position: relative先右偏移50%，再左偏移50%，注意将父容器设为float(第二偏移为内容宽度的一半)
		}
2. 垂直居中：  
	
		div {
			#单行:通过设置父元素的 height 和 line-height 高度一致来实现垂直居中
			height:100px;
			line-height:100px;
			#多行： 设置如下，兼容性差
			display:table-cell;
    		vertical-align:middle;
    	}

### 7. 特殊字符
	（回车换行） <br>
	（空格符） &nbsp;
	&（AND符号） &amp;
	<（左尖括号、小于号） &lt;
	>（右尖括号、大于号） &gt;
	°（度） &deg;
	•（间隔符） &#149;
	´ &acute;
	" &quot;
	“ &ldquo;
	” &rdquo;
	← &larr;
	↑ &uarr;
	→ &rarr;
	↓ &darr;
	↔ &harr;
	√ &radic;
	¥（RMB） &yen;
	≠ &ne;
	≡ &equiv;
	≤ &le;
	≥ &ge;
	⊕ &oplus;
	nr（上标情形） n<sup>r</sup>
	Ci（下标情形） C<sub>i</sub>
	加粗 <b>加粗</b>
	斜体 <i>斜体</i>
	下划线 <u>下划线</u>
	±（加减符号） &plusmn;
	×（乘法符号） &times;
	÷（除法符号） &divide;
	©（版权所有） &copy;
	®（注册商标） &reg;
	™（商标符号） &trade;
	—（破折号） &#151;