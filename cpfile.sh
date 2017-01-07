#!/bin/bash
#Author zhifei
#Time 2017/01/06
#Funcation copy file in the directory to other directory,and show difference

if [ $# == 0 ]; then
	echo "dont have param ,Please add"
	exit;
elif [ $# == 1 ]; then 
	echo "begin find and copy";
fi

declare -A findfilename

for item in `ls -a -S`
do
	if [[ $item =~ [[:alnum:]]+$1[[:alnum:]]+ ]];
	then
		echo "$item       |       yes"
	        let findfilename["$item"]++;
	else
		echo "$item       |       no"
        fi
done

echo  "weateher copy y/n"

read name
if [[ $name =~ ["y"|"Y"] ]];
then 
	if [[ -e copy && -d "copy" ]]; 
	then
		echo "will delete copy"
		rm -rf ./copy
		mkdir copy
	else
		mkdir copy
	fi
	
	for item in ${!findfilename[*]}
	do
		cp $item ./copy
		if [[ $? == 0  ]];
		then 
			echo "this ok"
		else
			echo "file"
		fi
	done
else 
	exit
fi

	


