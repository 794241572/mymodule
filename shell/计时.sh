#!/bin/bash
clear
read -t10 -p "请输入计时时间(s):" time
if [ ! $? -eq 0 ]
then
	clear
	echo -e "\033[31m 超过10s未输入，退出程序! \033[0m"
	exit 1
fi
clear
t=$time
while(($time>=100))
do
    echo -e -n "\b\b\b$time"
    sleep 1s
    let "time--"
done
clear
while(($time>=10))
do
	echo -e -n "\b\b$time"
	sleep 1s
	let "time--"
done
clear
while(($time>=0))
do
	echo -n -e "\b$time"
	sleep 1s
	let "time--"
done
echo
echo -e  "\033[32m 本次总共计时 $t 秒。\033[0m"

