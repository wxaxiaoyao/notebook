算数运算(expr)  
计数器(seq)
		
	for i in `seq 1 10`
	do
    	n=`expr $i + 1` 
    	echo $n
	done

local定义局部变量