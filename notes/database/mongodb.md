一 启动mongodb客户端
mongo ip:port/db_name -u xxx -p   // 参数均可省略               
tips: help                        // 使用说明

二 DB创建与删除
1 创建DB，   use db_name                                          // 创建并使用db_name数据库
2 删除DB,    use db_name; db.dropDataBase()                       // 先选择要删除的DB，再调用删除接口   
tips：db.help()                                                   // db操作用法介绍
