由于这是使用wget与curl 从服务器上下载相应的版本进行替换，由于网络原因可能导致部分用户从服务器下载缓慢或者无法下载，现在原有基础上增加离线版本，依赖sed，请检查sed是否安装,以下使用 on of替代 在线 离线  
ubuntu:on of ; centos:on ; alpine:of ; deepin:of ;debian:on of ;fedora:on ;arch of ;opensuse of;kali on of;  
可以使用脚本中的自动更换源默认更换为阿里云软件源  
因网易镜像站暂无kali软件源，且将网易kali软件源更改为中科大kali软件源  
使用方法:  
wget dl.lxw2004.xyz/linux/change.sh && chmod +x change.sh && ./change.sh
