## angular框架

### 常用指令:
ng-app 指令初始化一个 AngularJS 应用程序。  
ng-init 指令初始化应用程序数据。  
ng-model 指令把元素值（比如输入域的值）绑定到应用程序。  
ng-non-bindable 指令用于告诉AngularJS当前的HTML元素或其子元素不需要编译。即不需要Angular预处理


## 技巧
* [ui-router](http://www.html5jq.com/fe/angular_node/20150417/133.html)  
* [angular与requirejs整合](http://www.cnblogs.com/kenkofox/p/4643760.html)


## 判断AngularJS渲染页面完成 
	$scope.$on('$viewContentLoaded', function(){});
	$scope.$watch('$viewContentLoaded', function() {});  