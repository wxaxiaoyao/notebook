#!/bin/bash

echo "开始执行任务"
workDir="/C/Users/wuxiangan/workspace"

work() {
	#进入库目录
	cd $1

	#拉取文件
	git pull origin master

	#判断是否有问件修改
	#isModify=`git status | grep 'nothing added to commit'`
	#if [ -n "$isModify" ]; then
	#	exit  #没有修改直接退出
	#fi

	#提交修改
	git status
	git add -A .
	git commit -m "filesync"
	git push origin master
}

work ${workDir}/xiaoyao
#work /d/workspace/html/blog

echo -n "本次执行时间:  "

logFileRowCount=`wc -l /e/xiaoyao/filesync.log | awk '{print $1}'` 
if [ $logFileRowCount -gt 1000 ]; then 
	sed -i '1,1000d' /e/xiaoyao/filesync.log
	echo "日志文件过长已截断前1000行"
fi

echo "结束执行任务"