#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#=========================================================
#       System Required: Centos 6/7,Ubuntu 16/18,Debian 8+
#       Description: replace software source script
#       Version: 1.0
#       Author: wojiuchigua
#       Website: www.lxw2004.xyz
#=========================================================
#引用
source /etc/os-release
#变量
sh_ver="1.0"

dl="dl.lxw2004.xyz/linux"
error="错误"
kanxi="但是我拒绝s"
Error="错误"
gen="read -p"请输入数字""
none="请输入正确的数字"
muban=" 
--------------------选择系统-----------------------------
 ${Green_font_prefix}1.${Font_color_suffix} ubuntu
 ${Green_font_prefix}2.${Font_color_suffix} centos
 ${Green_font_prefix}3.${Font_color_suffix} debian
 ${Green_font_prefix}4.${Font_color_suffix} openSUSE
 ${Green_font_prefix}5.${Font_color_suffix} fedora
 ${Green_font_prefix}6.${Font_color_suffix} arch
 ${Green_font_prefix}7.${Font_color_suffix} kali
 ${Green_font_prefix}8.${Font_color_suffix} deepin
 ${Green_font_prefix}9.${Font_color_suffix} alpine
 ${Green_font_prefix}10.${Font_color_suffix} 返回上级
---------------------------------------------------------"

ubuntu1="
--------------------选择版本-----------------------------
 ${Green_font_prefix}1.${Font_color_suffix} ubuntu20.04
 ${Green_font_prefix}2.${Font_color_suffix} ubuntu18.04
 ${Green_font_prefix}3.${Font_color_suffix} ubuntu16.04
 ${Green_font_prefix}4.${Font_color_suffix} ubuntu14.04
 ${Green_font_prefix}9.${Font_color_suffix} 返回上级
---------------------------------------------------------"

centos1="
--------------------选择版本-----------------------------
 ${Green_font_prefix}1.${Font_color_suffix} centos8
 ${Green_font_prefix}2.${Font_color_suffix} centos7
 ${Green_font_prefix}3.${Font_color_suffix} centos6
 ${Green_font_prefix}9.${Font_color_suffix} back
---------------------------------------------------------"

debian1="
--------------------选择版本-----------------------------
 ${Green_font_prefix}1.${Font_color_suffix} debian9
 ${Green_font_prefix}2.${Font_color_suffix} debian8
 ${Green_font_prefix}3.${Font_color_suffix} debian7
 ${Green_font_prefix}9.${Font_color_suffix} back
---------------------------------------------------------"
openSUSE1="
--------------------选择版本-----------------------------
                请输入自己所需的版本
		例如15，11 a暂时不需要带小数
---------------------------------------------------------"
opensus="
-----------------------选择版本（详细）------------------
 ${Green_font_prefix}1.${Font_color_suffix} 0.1
 ${Green_font_prefix}2.${Font_color_suffix} 0.2
 ${Green_font_prefix}3.${Font_color_suffix} 0.3
 ${Green_font_prefix}4.${Font_color_suffix} 0.4
 ${Green_font_prefix}5.${Font_color_suffix} 0.5
 ${Green_font_prefix}6.${Font_color_suffix}返回上级
---------------------------------------------------------"
alpine="
--------------------------------------------------------
 ${Green_font_prefix}1.${Font_color_suffix} 2.4
 ${Green_font_prefix}1.${Font_color_suffix} 2.5
 ${Green_font_prefix}2.${Font_color_suffix} 2.6
 ${Green_font_prefix}3.${Font_color_suffix} 2.7
 ${Green_font_prefix}4.${Font_color_suffix} 3.0
 ${Green_font_prefix}5.${Font_color_suffix} 3.1
 ${Green_font_prefix}6.${Font_color_suffix} 3.10
 ${Green_font_prefix}7.${Font_color_suffix} 3.11
 ${Green_font_prefix}8.${Font_color_suffix} 3.2
 ${Green_font_prefix}9.${Font_color_suffix} 3.3
 ${Green_font_prefix}10.${Font_color_suffix} 3.4
 ${Green_font_prefix}11.${Font_color_suffix} 3.5
 ${Green_font_prefix}12.${Font_color_suffix} 3.6
 ${Green_font_prefix}13.${Font_color_suffix} 3.7
 ${Green_font_prefix}14.${Font_color_suffix} 3.8
 ${Green_font_prefix}15.${Font_color_suffix} 3.9
----------------------------------------------------"


#脚本更新
Update_shell(){
	echo -e "当前版本为 [ ${sh_ver}],检测新版本中..."
	sh_new_ver=$(wget --no-check-certificate -qO- "http://${dl}/change.sh"|grep 'sh_ver="'|awk -F"=" ' {print $NF}' |sed 's/\"//g'|head -1)
        [[ -z ${sh_new_ver} ]] && echo -e "${kanxi} 检测失败" && menu
	if [[ ${sh_new_ver} != ${sh_ver} ]]; then
	echo -e "发现新版本[${sh_new_ver}],是否更新?[Y/N]"	
        read -p "(默认Y):" yn
	[[ -z "${yn}" ]] && yn="y"
	if [[ ${yn} == [Yy] ]]; then
        wget -N --no-check-certificate http://${dl}/change && chmod +x change.sh
	echo -e "脚本更新为最新版本[ ${sh_new_ver}] !"
        else
		echo && echo "已取消..." && echo
	fi
        else
		echo -e "当前是最新版本[ ${sh_new_ver} ] !"
		sleep 5s
        fi


}


#以下结为自动化
#ubuntu
automation(){
if [ "${ID}" = "ubuntu" ];then
yuan="ali"
sys="${ID}"
ver="${VERSION_ID}.list"
bc=".bak"
fl="/etc/apt/sources.list"
update="apt-get update"
run
else
centostest
fi
}
#centos
centostest(){
if [ "${ID}" = "centos" ];then
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
if [ "${VERSION_ID}" = "7" ];then
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
sudo yum makecache && yum update
clear
echo -e "更换完成"
sleep 5s
else
centos61
fi
else
debiantest
fi
}

centos61(){
if [ "${VERSION_ID}" = "6" ];then
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
sudo yum makecache && yum update
clear
echo -e "更换完成"
sleep 5s
e
else
centos81
fi

}
centos81(){
if [ "${VERSION_ID}" = "8" ];then
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-8.repo
sudo yum makecache && yum update
clear
echo -e "更换完成"
sleep 5s
e
else
低版本暂时懒得写
fi
}
#debian
debiantest(){
if [ "${ID}" = "debian" ];then
yuan="ali"
sys="${ID}"
ver="${VERSION_ID}.list"
bc=".bak"
fl="/etc/apt/sources.list"
update="apt-get update"
run
else
fedoratest
fi
}
#fedora
fedoratest(){
if [ "${ID}" = "fedora" ];then
mv /etc/yum.repos.d/fedora.repo /etc/yum.repos.d/fedora.repo.backup
mv /etc/yum.repos.d/fedora-updates.repo /etc/yum.repos.d/fedora-updates.repo.backup
wget -O /etc/yum.repos.d/fedora.repo http://mirrors.aliyun.com/repo/fedora.repo
wget -O /etc/yum.repos.d/fedora-updates.repo http://mirrors.aliyun.com/repo/fedora-updates.repo
sudo yum makecache && yum update
else
kalitest
fi
}

kalitest(){
if [ "${ID}" = "kali" ];then
yuan="ali"
sys="${ID}"
ver="1.list"
bc=".bak"
fl="/etc/apt/sources.list"
update="apt-get update"
run
else
archtest
fi
}
archtest(){
if [ "${ID}" = "arch" ];then
yt="mirrors.aliyun.com"
bc=".backup"
fl="/etc/pacman.d/mirrorlist"
update="pacman -Syy"
h="http"
you1
else
deepintest
fi
}
deepintest(){
if [ "${ID}" = "deepin" ];then
yt="mirrors.aliyun.com"
h="http"
bc=".bak"
fl="/etc/apt/sources.list"
update="apt-get update"
depin
else
alpinetest
fi
}
alpinetest(){
if [ "${ID}" = "alpine" ];then
fl="/etc/apk/repositories"
update="apk update"
yt="mirrors.aliyun.com"
alpines
else
opensusetest
fi
}
opensuse(){
if [ "${ID}" = "opensuse-leap" ];then
oso="-f"
h="http"
yt="mirrors.aliyun.com"
vers="${VERSION_ID}"
update="zypper update"
opensuseuse
else
opensusea1
fi
}
opensusea1(){
if [ "${ID}" = "opensuse" ];then
oso="-f"
h="http"
yt="mirrors.aliyun.com"
vers="${VERSION_ID}"
update="zypper update"
osu
else
menu
fi
}
opensuseuse(){
if [ "${vers}" == "15.1" ];then
ve="/leap/"
osu
else
nicea2
fi
}
nicea2(){
if [ "${vers}" == "15.2" ];then
ve="/leap/"
osu
else
nicea3
fi
}
nicea3(){
if [ "${vers}" == "15.3" ];then
ve="/leap/"
osu
else
nicea4
fi
}
nicea4(){
if [ "${vers}" == "15.4" ];then
ve="/leap/"
osu
else
nicea5
fi
}
nicea5(){
if [ "${vers}" == "15.5" ];then
ve="/leap/"
osu
else
niceae1
fi
}
niceae1(){
if [ "${jieguo}" == "42.1" ];then
ve="/leap/"
osu
else
niceae2
fi
}
niceae2(){
if [ "${vers}" == "42.2" ];then
ve="/leap/"
osu
else
niceae3
fi
}
niceae3(){
if [ "${vers}" == "42.3" ];then
ve="/leap/"
osu
else
niceae4
fi
}
niceae4(){
if [ "${vers}" == "42.4" ];then
ve="/leap/"
osu
else
niceae5
fi
}
niceae5(){
if [ "${vers}" == "42.5" ];then
ve="/leap/"
osu
else
osu
fi
}
#主菜单
menu(){
clear
echo && echo -e "换源脚本菜单 ${Red_font_prefix}[v${sh_ver}]}${Font_color_suffix}
         -- 换源脚本 | www.lxw2004.xyz --
 ${Green_font_prefix}0.${Font_color_suffix}升级脚本
 --------------------选择系统源----------------------------
 ${Green_font_prefix}1.${Font_color_suffix} 阿里源
 ${Green_font_prefix}2.${Font_color_suffix} 腾讯源 
 ${Green_font_prefix}3.${Font_color_suffix} 清华源
 ${Green_font_prefix}4.${Font_color_suffix} 网易源
 ${Green_font_prefix}5.${Font_color_suffix} 自动更换源
 ${Green_font_prefix}6.${Font_color_suffix} 退出
 ---------------------------------------------------------" && echo -e "系统:${ID}版本:${VERSION_ID}"
 ${gen} main
 case "$main" in
	 1)
	yuan="ali"
	oso="-f"
	yt="mirrors.aliyun.com"
	h="http"
	syst
	 ;;
 	 2)
       yuan="tx"
       oso="-f"
       yt="mirrors.cloud.tencent.com"
       h="https"
       syst
         ;;
	 3)
       yuan="qh"
       oso="-f"
       yt="mirrors.tuna.tsinghua.edu.cn"
       h="https"
       syst
	 ;;
 	 4)
       yuan="wy"
       oso="-f"
       yt="mirrors.163.com"
       h="http"
       syst
 	 ;;
	 5)
	automation
	 ;;
	 6)
	clear
	exit 1
         ;;
         *)
         clear
	 echo -e "${Error} ${none}"
	 sleep 1s
	 menu
	 ;;
 esac
}

error(){
echo -e "开发中"


}
#系统选择
syst(){
clear
echo -e "${muban}"
 ${gen} os
case "$os" in
        1)
	sys="ubuntu"
	fl="/etc/apt/sources.list"
	bc=".bak"
	update="apt-get update"
	ub
	;;
	2)
	sys="centos"
	fl="/etc/yum.repos.d/CentOS-Base.repo"
	bc=".backup"
	update="yum makecache && yum update"
	ce
	;;
        3)	
	sys="debian"
	fl="/etc/apt/sources.list"
	bc=".bak"
	update="apt-get update"
	sudo apt install apt-transport-https ca-certificates
	de
	;;
   	4)
	update="sudo zypper ref && zypper update"
	op
	;;
	5)
	sys="fedora"
	fl="/etc/yum.repos.d/fedora.repo"
	fl2="/etc/yum.repos.d/fedora-updates.repo"
	bc=".backup"
	ver="1.repo"
	ver2="2.repo"
	update="yum makecache && yum update"
	run
	run2
       	;;
	6)
	fl="/etc/pacman.d/mirrorlist"
	update="pacman -Syy"
	you1
	;;
	7)
	bc=".bak"
	sys="kali"
	fl="/etc/apt/sources.list"
	update="apt-get update"
	ver="1.list"
	run
	;;
	8)
	bc=".bak"
	sys="deepin"
	update="apt-get update"
	ver="1.list"
	fl="/etc/apt/sources.list"
	run
	;;
	9)
	bc=".bak"
	sys="alpine"
	update="apk update"
	fl="/etc/apk/repositories"
	alpines
	;;
	10)
	menu
	;;
	*)
	clear
	 echo -e "${Error} ${none}"
	 sleep 1s
	 syst
	 ;;
	 
 esac
}



#ubuntu选择菜单
ub(){
clear
echo -e "${ubuntu1}"
 ${gen} num
 case "$num" in
	1)
	ver="20.04.list"
        run
	;;
	2)
	ver="18.04.list"
        run
	;;
        3)
	ver="16.04.list"
	run
	;;
   	4)
	ver="14.04.list"
	run
	;;
	5)
	#aliubuntu
       	;;
	6)
	#aliubuntu
	;;
	7)
	#aliubuntu
	;;
	8)
	#aliubuntu
	;;
	9)
	syst
	;;
	*)
	clear
	 echo -e "${Error} ${none}"
	 sleep 1s
	 ub
	 ;;
	 
 esac
}
#debian选择菜单
de(){
clear
echo -e "${debian1}"
 ${gen} num
 case "$num" in
	1)
	ver="9.list"
       run
	;;
	2)
	ver="8.list"
       run
	;;
        3)
	ver="7.list"
       run	
	;;
   	4)
    	;;
	5)
	
       	;;
	6)
	
	;;
	7)
	
	;;
	8)
	
	;;
	9)
	syst
	;;
	*)
	clear
	 echo -e "${Error} ${none}"
	 sleep 1s
	 de
	 ;;
	 
 esac
}
#centos选择菜单
ce(){
clear
echo -e "${centos1}"
 ${gen} num
 case "$num" in
	1)
	ver="8.repo"
       run
	;;
	2)
	ver="7.repo"
       run
	;;
        3)
	ver="6.repo"
       run	
	;;
   	4)
       run
	;;
	5)
	
       	;;
	6)
	
	;;
	7)
	
	;;
	8)
	
	;;
	9)
	syst
	;;
	*)
	clear
	 echo -e "${Error} ${none}"
	 sleep 1s
	 ce
	 ;;
	 
 esac
}
#alpine使用
alpines(){
mc ${fl}.bak ${fl}
cp ${fl} ${fl}.bak
sed -i 's/dl-cdn.alpinelinux.org/'"${yt}"'/g' ${fl}
${update}
}
alpine1(){
clear
echo -e "${alpine}"
 ${gen} num
 case "$num" in
	0)
	ver="2.4"
        run
	;;
	1)
	ver="2.5"
        run
	;;
        2)
	ver="2.6"
        run	
	;;
   	3)
	ver="2.7"
	run
    	;;
	4)
	ver="3.0"
	run
       	;;
	5)
	ver="3.1"
	run
	;;
	6)
	ver="3.10"
	run
	;;
	7)
	ver="3.11"
	run
	;;
	8)
	ver="3.2"
	run
	;;	
	9)
	ver="3.3"
       run
	;;
	10)
	ver="3.4"
       run
	;;
        11)
	ver="3.5"
       run	
	;;
   	12)
	ver="3.6"
	run
    	;;
	13)
	ver="3.7"
	run
       	;;
	14)
	ver="3.8"
	run
	;;
	15)
	ver="3.9"
	run
	;;
	*)
	clear
	 echo -e "${Error} ${none}"
	 sleep 1s
	 alpine1
	 ;;
	 
 esac
}
#y皆为opensuse任务处理
op(){
echo -e "${openSUSE1}"
${gen} jieguo
nums=`echo ${jieguo} |sed 's/[-0-9]//g'`
if [ ! -z ${nums} ]
then
echo -e "请输入纯数字"
else
guodu
fi

}

guodu(){
if [ "${jieguo}" == "15" ];then
 ve="/leap/"
 jixua
else
zailai 
fi
}
zailai(){
if [ "${jieguo}" == "42" ];then
 ve="/leap/"
 jixua
else
jixua
fi
}

jixua(){
echo -e "${opensus}"
${gen} meiyong
 case "$meiyong" in
	1)
	vers="${jieguo}.1"
       osu
	;;
	2)
	vers="${jieguo}.2"
	osu
	;;
        3)
	vers="${jieguo}.3"
	osu	
	;;
   	4)
	vers="${jieguo}.4"
	osu
	;;
	5)
	vers="${jieguo}.5"
	osu
	;;
	*)
	clear
	 echo -e "${Error} ${none}"
	 sleep 1s
	 jixua
	 ;;
	 
 esac
}
#arch任务处理
you1(){
cp ${fl} ${fl}.backup
sed -i '1 i\Server = '"${h}"'://'"${yt}"'/archlinux/$repo/os/$arch' ${fl}
${update}
echo -e "完成"
sleep 3s
}
#deepin任务处理
depin(){
cp ${fl} ${fl}.bak
sed -i '1 i\deb [by-hash=force] '"${h}"'://'"${yt}"'/deepin lion main contrib non-free' ${fl}
${update}
echo -e "完成"
sleep 3s
}

#opensuse任务处理
osu(){
echo -e "${ve}${vers}"
sudo zypper mr -da
sduo zypper rr rpos
sudo zypper rr rpnos
sudo zypper rr uposs
duo zypper rr upnos
sudo zypper addrepo ${oso} ${h}://${yt}/opensuse/distribution${ve}${vers}/repo/oss/ rpos
sudo zypper addrepo ${oso} ${h}://${yt}/opensuse/distribution${ve}${vers}/repo/non-oss/ rpnos
sudo zypper addrepo ${oso} ${h}://${yt}/opensuse/update${ve}${vers}/oss/ uposs
sudo zypper addrepo ${oso} ${h}://${yt}/opensuse/update${ve}${vers}/non-oss/ upnos
${update}
echo -e "完成"
sleep 3s
}
#r基本任务处理
run(){
echo -e "${fl}${dl}${yuan}${sys}${ver}${bc}"
echo -e "${yuan}${sys}${ver}"
echo -e "使用wget下载"
rm -rf ${yuan}${sys}${ver}
wget --no-check-certificate http://${dl}/${yuan}${sys}${ver}
if [ -f "${yuan}${sys}${ver}" ];then
echo -e "下载完成"
cp ${fl} ${fl}${bc}
echo -e "已备份"
rm -rf ${fl}
mv ${yuan}${sys}${ver} ${fl}
${update}
clear
echo -e "更换完成"
sleep 3s
else
echo -e "wget下载失败请确认是否安装wget,即将使用curl下载"
sleep 5s
bcup
fi
}
bcup(){
curl -O http://${dl}/${yuan}${sys}${ver}
if ( cat ${yuan}${sys}${ver}|grep "404" );then
clear
echo -e "下载失败请检查网络链接"
rm -rf ${yuan}${sys}${ver}
else
echo -e "下载完成"
cp ${fl} ${fl}${bc}
echo -e "已备份"
rm -rf ${fl}
mv ${yuan}${sys}${ver} ${fl}
${update}
clear
echo -e "更换完成"
sleep 3s
fi
}

run2(){
echo -e "${fl2}${dl}${yuan}${sys}${ver2}${bc}"
echo -e "${yuan}${sys}${ver2}"
echo -e "使用wget下载"
rm -rf ${yuan}${sys}${ver2}
wget --no-check-certificate http://${dl}/${yuan}${sys}${ver2}
if [ -f "${yuan}${sys}${ver2}" ];then
echo -e "下载完成"
cp ${fl2} ${fl2}${bc}
echo -e "已备份"
rm -rf ${fl2}
mv ${yuan}${sys}${ver2} ${fl2}
${update}
clear
echo -e "更换完成"
sleep 3s
else
echo -e "wget下载失败请确认是否安装wget,即将使用curl下载"
sleep 5s
bcup
fi
}
bcup2(){
curl -O http://${dl}/${yuan}${sys}${ver2}
if ( cat ${yuan}${sys}${ver2}|grep "404" );then
clear
echo -e "下载失败请检查网络链接"
rm -rf ${yuan}${sys}${ver2}
else
echo -e "下载完成"
cp ${fl2} ${fl2}${bc}
echo -e "已备份"
rm -rf ${fl}
mv ${yuan}${sys}${ver2} ${fl2}
${update}
clear
echo -e "更换完成"
sleep 3s
fi
}

menu



