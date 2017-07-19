**上传文件代码示例:**  

	<form >
	<lable for="file_id">文件名:</lable>                   // 关联标签 可无
	<input type="file" name="file" id="file_id">          // name值为代码中key值，用于取相关信息，id js相关使用
	<input type="submit" value="提交">                     // 提交按钮 
	</form>


**禁止缓存本页**

	<meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0"> 


**iframe高度自适应**
>http://www.cnblogs.com/slyzly/articles/2422737.html

	<div style="display: flex; flex-direction: column;">
        <iframe id="iframe1"  src="http://localhost:63342/html/xiaoyao/src/html/templates/test.html" scrolling="no" frameborder="0" marginwidth="0"  marginheight="0"></iframe>
    </div>
	
	<script>
		var iframe = window.parent.document.getElementById("iframe1");
		iframe.style.height = iframe.contentWindow.document.body.scrollHeight + "px";
	</script>

**强制更新视图**
>$scope.$apply();