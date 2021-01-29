#!/bin/bash

####################################################
# Name    : vip.sh                                 #
# Date    : 2020.12.03                             #
# auther  : jeffrey                                #
####################################################

#清屏
clear


#会员操作界面
for ((;;))
do
    clear
    echo "***************** 会员登录 *****************"
    echo -e "\t\t买买买商店"
    echo -e "\t\t1.会员登录"
    echo -e "\t\t2.会员注册"
    echo -e "\t\t3.修改密码"
    echo -e "\t\t4.密码找回"
    echo -e "\t\t5.退出"
    echo "***************** 会员登录 *****************"
    echo
    read -p "输入序号进行相关操作:" n

    #会员登录
    if [ $n -eq 1 ]
    then
        read -p "请输入您的手机号：" username

        #登录验证
        test -e /Users/freeze/shell/user/${username}.txt
        if [ $? -eq 0 ]
        then
            read -p  "请输入您的会员密码：" -s  password
            key=`awk -F "：" 'NR==5{print $2}' /Users/freeze/shell/user/${username}.txt `
            if [ $password == $key ]
            then
		        clear
                echo -e "\t\t正在登陆，请稍候。。。"
                sleep 2s
		        bash /Users/freeze/shell/shop.sh	
            else
                clear
                echo -e "输入密码错误！"
                read -p "#按回车键返回#"
            fi
        else
            echo -e "输入手机号错误！"
            read -p "#按回车键返回#"
        fi

    #会员注册
    elif [ $n -eq 2 ]
    then
        read -p "请输入您的手机号：" username
        if [ $username -gt 0 ] && [ ${#username} -eq 11 ]
        then

            #验证手机号是否被注册
            test -e /Users/freeze/shell/user/${username}.txt
            if [ $? -ne 0 ]
            then
                read -p "请输入您的身份证号：" ID
                if [ $ID -gt 0 ] && [ ${#ID} -eq 18 ]
                then
                    clear
                    echo "***************** 注册信息 *****************"
                    echo
                    echo -e "您注册的手机号为：$username"
                    echo -e "您的身份证号为：$ID"
                    echo -e "默认密码为：dev@easyops"
                    echo -e 
                    echo "***************** 注册信息 *****************"
                    echo
                    read -p "#按回车键返回#"

                    #保存用户信息
                    echo "***************** 用户信息 *****************">>/Users/freeze/shell/user/${username}.txt
                    echo                                              >>/Users/freeze/shell/user/${username}.txt
                    echo -e "手机号为：$username"                       >>/Users/freeze/shell/user/${username}.txt
                    echo -e "身份证号为：$ID"                           >>/Users/freeze/shell/user/${username}.txt
                    echo -e "密码为：dev@easyops"                      >>/Users/freeze/shell/user/${username}.txt
                    echo                                              >>/Users/freeze/shell/user/${username}.txt
                    echo "***************** 用户信息 *****************" >>/Users/freeze/shell/user/${username}.txt
                else
                    echo -e "身份证号格式错误！"
                    read -p "#按回车键返回#"
                fi
            
            else
                echo -e "该手机号已被注册！"
                read -p "#按回车键返回#"
            fi

        else
            echo -e "输入手机号格式错误！"
            read -p "#按回车键返回#"
        fi

    #修改密码
    elif [ $n -eq 3 ]
    then
        read -p "请输入您的手机号：" username
        test -e /Users/freeze/shell/user/${username}.txt
        if [ $? -eq 0 ]
        then

            #验证用户身份，通过调出用户信息
            read -p "请输入您的身份证号：" ID
            if [ $ID -gt 0 ] && [ ${#ID} -eq 18 ]
            then
                grep $ID </Users/freeze/shell/user/${username}.txt >>/dev/null
                if [ $? -eq 0 ]
                then
                    clear
                    for ((;;))
                    do
                        read -s -p "请输入新密码(6-16位)：" a
                        echo
                        if [ ${#a} -ge 6 ] && [ ${#a} -le 16 ]
                        then
                            clear
                            read -s -p "再次输入密码：" b
                            echo
                            if [ $a = $b ]
                            then
                                clear
                                echo -e "修改密码成功"
                                key=`awk -F "：" 'NR==5{print $2}' /Users/freeze/shell/user/${username}.txt `
                                #保存用户信息
                                echo "***************** 用户信息 *****************">/Users/freeze/shell/user/${username}.txt
                                echo                                              >>/Users/freeze/shell/user/${username}.txt
                                echo -e "手机号为：$username"                       >>/Users/freeze/shell/user/${username}.txt
                                echo -e "身份证号为：$ID"                           >>/Users/freeze/shell/user/${username}.txt
                                echo -e "密码为：$a"                               >>/Users/freeze/shell/user/${username}.txt
                                echo                                              >>/Users/freeze/shell/user/${username}.txt
                                echo "***************** 用户信息 *****************" >>/Users/freeze/shell/user/${username}.txt
                                read -p "#按回车返回#"
                                break
                            else
                                clear
                                echo -e "两次输入密码不一致，请重试"
                                read -p "#按回车键返回，重新设置密码#"
                            fi
                        else
                            clear
                            echo -e "新密码长度不符合要求，请重试"
                            read -p "#按回车键返回，重新设置密码#"
                        fi                       
                        
                    done

                else
                    echo -e "身份证输入错误"
                    read -p "#按回车键返回#"
                fi
            else
                echo -e "身份证号格式错误！"
                read -p "#按回车键返回#"
            fi

        else
            echo -e "手机号未注册"
            read -p "#按回车键返回#"
        fi  

    #密码找回
    elif [ $n -eq 4 ]
    then
        read -p "请输入您的手机号：" username
        test -e /Users/freeze/shell/user/${username}.txt
        if [ $? -eq 0 ]
        then

            #验证用户身份，通过调出用户信息
            read -p "请输入您的身份证号：" ID
            if [ $ID -gt 0 ] && [ ${#ID} -eq 18 ]
            then
                grep $ID </Users/freeze/shell/user/${username}.txt >>/dev/null
                if [ $? -eq 0 ]
                then
		            clear
                    cat /Users/freeze/shell/user/${username}.txt
                    echo 
                    read -p "#按回车键返回#"
                else
                    echo -e "身份证输入错误"
                    read -p "#按回车键返回#"
                fi
            else
                echo -e "身份证号格式错误！"
                read -p "#按回车键返回#"
            fi

        else
            echo -e "手机号无效"
            read -p "#按回车键返回#"
        fi  

    
    #退出系统
    elif [ $n -eq 5 ]
    then
        break


    #非法输入
    else
        echo -e "请正确输入序号"
        read -p "#按回车键返回#"

    fi

done
