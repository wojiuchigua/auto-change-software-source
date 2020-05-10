#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#=========================================================
#       onautomationem Required: Centos 6/7,Ubuntu 16/18,Debian 8+
#       Description: replace software source script
#       Version: 1.0
#       Author: wojiuchigua
#       Website: www.lxw2004.xyz
#=========================================================
#引用
source /etc/os-release
#变量
sh_ver="2.0"

dl="dl.lxw2004.xyz/linux"
error="错误"
kanxi="但是我拒绝s"
Error="错误"
gen="read -p"请输入数字""
none="请输入正确的数字"
tongyong="
--------------------选择系统源----------------------------
${Green_font_prefix}1.${Font_color_suffix} 阿里源
${Green_font_prefix}2.${Font_color_suffix} 腾讯源
${Green_font_prefix}3.${Font_color_suffix} 清华源
${Green_font_prefix}4.${Font_color_suffix} 网易源
${Green_font_prefix}5.${Font_color_suffix} 退出
---------------------------------------------------------"
onmuban="
--------------------选择系统-----------------------------
 ${Green_font_prefix}1.${Font_color_suffix} ubuntu
 ${Green_font_prefix}2.${Font_color_suffix} centos
 ${Green_font_prefix}3.${Font_color_suffix} debian
 ${Green_font_prefix}4.${Font_color_suffix} fedora
 ${Green_font_prefix}5.${Font_color_suffix} 返回上级
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
##这个源太多啦不干
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

#选择离线在线与自动
allselect(){
clear
echo && echo -e "换源脚本菜单 ${Red_font_prefix}[v${sh_ver}]}${Font_color_suffix}
         -- 换源脚本 | www.lxw2004.xyz --
${Green_font_prefix}0.${Font_color_suffix}升级脚本
--------------------选择版本----------------------------
${Green_font_prefix}1.${Font_color_suffix} 在线
${Green_font_prefix}2.${Font_color_suffix} 离线
${Green_font_prefix}3.${Font_color_suffix} 退出
${Green_font_prefix}4.${Font_color_suffix} 离线版本初始化第一次使用
---------------------------------------------------------" && echo -e "系统:${ID}版本:${VERSION_ID}"
${gen} main
case "$main" in
0)
Update_shell
;;
1)
online
;;
2)
offline
;;
3)
exit 1
;;
4)
ofinit
;;
*)
clear
echo -e "${Error} ${none}"
sleep 1s
allelect
;;
esac
}
#在线主菜单
online(){
clear
echo -e "${tongyong}"
${gen} onl
case "$onl" in
1)
yuan="ali"
oso="-f"
yt="mirrors.aliyun.com"
h="http"
onautomation
;;
2)
yuan="tx"
oso="-f"
yt="mirrors.cloud.tencent.com"
h="https"
onautomation
;;
3)
yuan="qh"
oso="-f"
yt="mirrors.tuna.tsinghua.edu.cn"
h="https"
onautomation
;;
4)
yuan="wy"
oso="-f"
yt="mirrors.163.com"
h="http"
onautomation
;;
5)
clear
exit 1
;;
*)
clear
echo -e "${Error} ${none}"
sleep 1s
online
;;
esac
}

  #以下结为自动化
  #ubuntu
onautomation(){
if [ "${ID}" = "ubuntu" ];then
sys="${ID}"
ver="${VERSION_ID}.list"
bc=".bak"
fl="/etc/apt/sources.list"
update="sudo apt-get update"
run
else
oncentos
fi
}
#centos
oncentos(){
if [ "${ID}" = "centos" ];then
echo -e "仅支持6以上的版本"
update="sudo yum makecache && yum update"
sys=${ID}
ver="${VERSION_ID}.repo"
bc=".bakup"
fl="/etc/yum.repos.d/CentOS-Base.repo"
run
else
ondebian
fi
}
  #debian
ondebian(){
if [ "${ID}" = "debian" ];then
sys="${ID}"
ver="${VERSION_ID}.list"
bc=".bak"
fl="/etc/apt/sources.list"
update="sudo apt-get update"
run
else
onfedora
fi
}
#fedora
onfedora(){
if [ "${ID}" = "fedora" ];then
sys="${ID}"
fl="/etc/yum.repos.d/fedora.repo"
fl2="/etc/yum.repos.d/fedora-updates.repo"
bc=".backup"
ver="1.repo"
ver2="2.repo"
update="yum makecache && yum update"
else
onkali
fi
}

onkali(){
yt="${yt}"
if [ "${ID}" = "kali" ];then
sys="${ID}"
ver="1.list"
bc=".bak"
fl="/etc/apt/sources.list"
update="sudo apt-get update"
run
else
clear
echo -e "剩下的只有离线版本啦"
fi
}
#r基本任务处理,本不想使用这么蠢的结构不过我好懒啊
run(){
echo -e "使用wget下载"
mv ${fl} ${fl}${bc}
echo -e "已备份"
wget -O ${fl} http://${dl}/${yuan}${sys}${ver}
if [ -f "${fl}" ];then
echo -e "下载完成"
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
mv ${fl}${bc} ${fl}
else
echo -e "下载完成"
mv ${fl} ${fl}${bc}
echo -e "已备份"
rm -rf ${fl}
mv ${yuan}${sys}${ver} ${fl}
${update}
clear
echo -e "更换完成"
sleep 3s
fi
}
#我懒了直接复制修改吧
run2(){
echo -e "使用wget下载"
mv ${fl2} ${fl2}${bc}
echo -e "已备份"
wget -O ${fl2} http://${dl}/${yuan}${sys}${ver2}
if [ -f "${fl2}" ];then
echo -e "下载完成"
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
mv ${fl2}${bc} ${fl2}
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

ofinit(){
if [ "${ID}" = "ubuntu" ];then
cp /etc/apt/sources.list /etc/apt/sources.list.bak.bak
echo -e "完成"
slee 1s
allselect
else
ofinitalpine
fi
}
ofinitalpine(){
if [ "${ID}" = "alpine" ];then
cp /etc/apk/repositories /etc/apk/repositories.bak.bak
echo -e "完成"
slee 1s
allselect
else
ofinitdeepin
fi
}
ofinitdeepin(){
if [ "${ID}" = "deepin" ];then
cp /etc/apt/sources.list /etc/apt/sources.list.bak.bak
echo -e "完成"
slee 1s
allselect
else
ofinitdebian
fi
}
ofinitdebian(){
if [ "${ID}" = "deepin" ];then
cp /etc/apt/sources.list /etc/apt/sources.list.bak.bak
sudo apt install apt-transport-https ca-certificates
echo -e "完成"
slee 1s
allselect
else
ofinitarchlinux
fi
}
ofinitarchlinux(){
if [ "${ID}" = "archlinux" ];then
cp /etc/apt/sources.list /etc/apt/sources.list.bak.bak
echo -e "完成"
slee 1s
allselect
else
ofinitopensuse
fi
}
ofinitopensuse(){
if [ "${ID}" = "archlinux" ];then
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak.bak
echo -e "完成"
slee 1s
allselect
else
ofinitkali
fi
}
ofinitkali(){
if [ "${ID}" = "kali" ];then
cp /etc/apt/sources.list /etc/apt/sources.list.bak.bak
clear
echo -e "完成"
slee 1s
allselect
else
echo -e "没有离线版本了哦请选择在线模式，或者真没有"
fi
}


ofline(){
clear
echo -e "${tongyong}"
${gen} yes
case "$yes" in
1)
yuan="ali"
oso="-f"
yt="mirrors.aliyun.com"
h="http"
ofautomation
;;
2)
yuan="tx"
oso="-f"
yt="mirrors.cloud.tencent.com"
h="https"
ofautomation
;;
3)
yuan="qh"
oso="-f"
yt="mirrors.tuna.tsinghua.edu.cn"
h="https"
ofautomation
;;
4)
yuan="wy"
oso="-f"
yt="mirrors.163.com"
h="http"
ofautomation
;;
5)
clear
exit 1
;;
*)
clear
echo -e "${Error} ${none}"
sleep 1s
ofline
;;
esac
}

ofautomation(){
cp
if [ "${ID}" = "ubuntu" ];then
cp /etc/apt/sources.list.bak.bak /etc/apt/sources.list
sed -i 's/archive.ubuntu.com/'"${yt}"'/g' /etc/apt/sources.list
sed -i 's/security.ubuntu.com/ubuntu/'"${yt}"'/g' /etc/apt/sources.list
sudo apt-get update
clear
echo -e "完成"
slee 1s
else
ofalpine
fi
}
ofalpine(){
if [ "${ID}" = "alpine" ];then
cp /etc/apt/sources.list.bak.bak /etc/apt/sources.list
sed -i 's/dl-cdn.alpinelinux.org/'"${yt}"'/g' /etc/apk/repositories
sudo apk update
clear
echo -e "完成"
slee 1s
else
ofdeepin
fi
}
ofdeepin(){
if [ "${ID}" = "deepin" ];then
cp /etc/apt/sources.list.bak.bak /etc/apt/sources.list
echo "deb [by-hash=force] ${h}${yt}}/deepin lion main contrib non-free" > /etc/apt/sources.list
sudo apt-get update
clear
echo -e "完成"
slee 1s
else
ofdebian
fi
}
ofdebian(){
if [ "${ID}" = "debian" ];then
cp /etc/apt/sources.list.bak.bak /etc/apt/sources.list
sed -i 's/deb.debian.org/'"${yt}"'/g' /etc/apk/repositories
sed -i 's/ftp.debian.org/'"${yt}"'/g' /etc/apk/repositories
sudo apt install apt-transport-https ca-certificates
echo
sudo apt-get update
clear
echo -e "完成"
slee 1s
else
ofarchlinux
fi
}
ofarchlinux(){
if [ "${ID}" = "kali" ];then
cp /etc/pacman.d/mirrorlist.bak.bak /etc/pacman.d/mirrorlist
sed -i '1 i\Server = '"${h}"'://'"${yt}"'/archlinux/$repo/os/$arch' ${fl}
sudo pacman -Syy
clear
echo -e "完成"
slee 1s
else
ofopensuse
fi
}
ofopensuse(){
if [ "${ID}" = "opensuse" ];then
leaptest
else
ofkali
fi
}
leaptest(){
if ( cat ${VERSION_ID}|grep "45 15" );then
vers="${VERSION_ID}"
ve="/leap"
runopensuse
else
runopensuse
fi
}
runopensuse(){
sudo zypper mr -da
sduo zypper rr rpos
sudo zypper rr rpnos
sudo zypper rr uposs
sduo zypper rr upnos
sudo zypper addrepo ${oso} ${h}://${yt}/opensuse/distribution${ve}${vers}/repo/oss/ rpos
sudo zypper addrepo ${oso} ${h}://${yt}/opensuse/distribution${ve}${vers}/repo/non-oss/ rpnos
sudo zypper addrepo ${oso} ${h}://${yt}/opensuse/update${ve}${vers}/oss/ uposs
sudo zypper addrepo ${oso} ${h}://${yt}/opensuse/update${ve}${vers}/non-oss/ upnos
zypper update
clear
echo -e "完成"
slee 1s
}
ofkali(){
if [ "${ID}" = "kali" ];then
cp /etc/apt/sources.list.bak.bak /etc/apt/sources.list
echo "deb ${h}${yt}/kali kali-rolling main non-free contrib\ndeb-src ${h}${yt}/kali kali-rolling main non-free contrib" > /etc/apt/sources.list
sudo apt-get update
clear
echo -e "完成"
slee 1s
else
echo -e "没有了呢请看看在线版本,要么真没有"
fi
}
allselect
