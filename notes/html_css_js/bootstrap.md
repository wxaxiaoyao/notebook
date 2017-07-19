## 标签页
	<div style="display: flex"> 
        <ul class="nav nav-tabs nav-stacked">
            <li class="active"><a href="#EditWebsiteBasicSetUp" data-toggle="tab">基本设置</a></li>
            <li><a href="#EditWebsiteAdvancedSetUp" data-toggle="tab">高级设置</a></li>
        </ul>
   
        <div class="tab-content">
            <div class="tab-pane fade in active" id="EditWebsiteBasicSetUp">
                <div class="pane panel-default">
                    <div class="panel-heading">
                        基本设置
                    </div>
                    <div>
						基本设置
                    </div>
                </div>
            </div>

            <div class="tab-pane fade in" id="EditWebsiteAdvancedSetUp">
                <div class="pane panel-default">
                    <div class="panel-heading">
                        高级设置
                    </div>
                    <div>
                        高级设置
                    </div>
                </div>
            </div>
        </div>
    </div>


## ng-if 尽量用ng-show代替


## select
	<div ng-controller="TestCtrl">
  		<select ng-change="change(x)" ng-model="x">
    		<option value="1">1</option>
    		<option value="2">2</option>
    		<option value="3">3</option>
  		</select>
	</div>



### .container 与 .container-fluid 区别
>.container 类用于固定宽度并支持响应式布局的容器。  
>.container-fluid 类似于100%宽度，占据全部视口（viewport）的容器。  
