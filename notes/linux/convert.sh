#!/bin/bash

dstDir='.'
stylesheet='md_extend.css'

main() {
	for filename in `ls $1` 
	do
		local filepath="${1}/${filename}"
		if [ -d $filepath ]; then 
			main $filepath
			continue
		fi
		local filetype=`echo $filename | awk -F . '{print $2}'`
		if [ "$filetype" != 'html' ]; then 
			continue
		fi
		htmlFormat $filepath
	done
}

htmlFormat() {
	local dstFile=$1
	echo $dstFile
	local tempFilename=`date +%s`
	cat $dstFile | tr -d '\r' > $tempFilename
	sed -i '1,/^<body>$/d' $tempFilename
	sed -i '/^<\/body>$/,$d' $tempFilename

	cat $stylesheet > $dstFile
	cat $tempFilename >> $dstFile

	rm -fr $tempFilename
}

main $dstDir
