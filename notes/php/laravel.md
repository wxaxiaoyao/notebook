
laravel API
--
[laravel框架API](https://laravel.com/api/5.2/index.html)

## 数据库
### 起步
	fillable  #批量赋值白名单
	guarded   #批量赋值黑名单
	hidden    #json中属性隐藏
	visible   #json中属性暴露

### 迁移
迁移文件位于database/migrations目录下，迁移类存在up和down两个方法，分别对应创建与撤销.  

	php artisan make:migration create_users_table --create=users       #创建表
	php artisan make:migration add_votes_to_users_table --table=users  #修改表
	php artisan migrate                                                #执行迁移 --force强制执行
	php artisan migrate:rollback                                       #回滚最近一次迁移
	php artisan migrate:reset	                                       #回滚全部迁移
	php artisan migrate:refresh                                        #回滚全部并执行迁移  --seed 附带填充数据

### 数据填充
    php artisan make:seeder UserTableSeeder       # 创建填充类
    php artisan db:seed                           # 运行填充类DatabaseSeeder
    php artisan db:seed --class=UserTableSeeder   # 运行指定填充类
    php artisan migrate:refresh --seed            # 回滚迁移并填充数据


### Eloquent ORM --- 关联关系
Eloquent关联关系以Eloquent模型类方法的形式被定义,方法返回为查询构建器，同名属性为查询对象。
>如文章评论示例:
>
	class Article extends Model{
    	/**
     	* 获取关联到文章的评论
     	*/
    	public function comments()
    	{
			return $this->hasOne(Comment::class);
    	}
	}
	Article::first()->comments()->first();      // 使用方法名返回查询构建器
	Article::first()->comments;                 // 使用动态属性

#### 一对一
	return $this->hasOne(RelationModel::class, foreignKey, primaryKey);
	return $this->belongTo(RelationModel::class, foreignKey, primaryKey);
#### 一对多
	return $this->hasMany(RelationModel::class, foreignKey, primaryKey);
	return $this->belongTo(RelationModel::class, foreignKey, primaryKey);
#### 多对多
	return $this->belongsToMany(RelationModel::class, relationTableName, LocalForeignKey,RelationForeign);
	return $this->belongsToMany(RelationModel::class, relationTableName, LocalForeignKey,RelationForeign);
>单词释义：  
>RelationModel:与当前模型存在关联关系的模型  
>primaryKey:关联关系中的主键字段  
>foreignKey:关联关系中的外键字段  
>relationTableName:多对多关联产生的中间表名  
>LocalForeignKey:当前模型在中间表中的外键名  
>RelationForeign:关联模型在中间表中的外键名  
>如： 文章（id主键）  评论(id 主键 articleId（文章外键）  文章与评论为一对多关系:  
>		
	return $this->hasMany(Comment::class, 'articleId', 'id');  #文章模型关系方法中
	return $this->belongTo(Article::class, 'articleId', 'id'); #评论模型关系方法中
