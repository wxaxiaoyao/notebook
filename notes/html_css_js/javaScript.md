####js循坏调用
1 `requestAnimationFrame(function(){});`   // 根据电脑配置自动设置循环间隔  
2 `setTimeout(function(){}, time);`        // time秒后调用  
3 `setInterval(function(){},time);`        // 先调用，time秒后再次调用  
requestAnimationFrame简单封装
	
	window.requestAnimFrame = (function() {
		return window.requestAnimationFrame || window.webkitRequestAnimationFrame || window.mozRequestAnimationFrame || window.oRequestAnimationFrame || window.msRequestAnimationFrame ||
			function( /* function FrameRequestCallback */ callback, /* DOMElement Element */ element) {
				return window.setTimeout(callback, 1000 / 60);
		};
	})();

####闭包	
	var add = (function () {
    	var counter = 0;
    	return function () {return counter += 1;}
	})();
	//最外层右()是对左()内的行数进行调用，返回一个闭包函数


###js原型__proto__与prototype
1. 所有构造器/函数的__proto__都指向Function.prototype，它是一个空函数（Empty function）
2. 所有对象的__proto__都指向其构造器的prototype
	
		function Person() {}                                              // 定义Person类的构造函数
	    console.log(Object.prototype);                                    // Output:Obejct{}
	    console.log(Function.prototype);                                  // Output:Function()
		console.log(Person.prototype);                                    // Output:Person{}
	    console.log(Object.prototype.__proto__ === null);                 // Output:true
	    console.log(Function.prototype.__proto__ === Object.prototype);   // Output:true
	    console.log(Function.__proto__ === Function.prototype);           // Output:true
	    console.log(Person.prototype.__proto__ === Object.prototype);     // Output:true
	    console.log(Person.__proto__ === Function.prototype);             // Output:true
		Object.prototype.__proto__ === null                               // Object类Object.prototype为根对象,前向链指针__proto__ === null
		// built-in内嵌类
		Function.prototype.__proto__ === Object.prototype;                // 函数类Function.prototype继承Object类Object.prototype 
		Function.__proto__ === Function.prototype                         // Function函数构造函数为函数类对象
		// 自定义类	
		Person.prototype.__proto__ === Object.prototype                   // Person类Person.prototype继承Object类Object.prototype
		Person.__proto__ === Function.prototype                           // Person构造函数为函数类对象   
3. 参考:  
[http://www.cnblogs.com/snandy/archive/2012/09/01/2664134.html](http://www.cnblogs.com/snandy/archive/2012/09/01/2664134.html)	
		

**获取变量类型**  

	const t = "test varible type";  	
	typeof(t); // stirng

**随机数和取整**  

	Math.random();   结果为0-1间的一个随机数(包括0,不包括1) 
	Math.floor(num); 参数num为一个数值，函数结果为num的整数部分。 
	Math.round(num); 参数num为一个数值，函数结果为num四舍五入后的整数。
	Math.ceil(num);  返回大于等于num的最小整数。