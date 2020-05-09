可以使用该脚本更换软件源,自动或手动都可以,自动换源拥有离线与在线属性,所需依赖wget curl sed  
由于这是使用wget与curl 从服务器上下载相应的版本进行替换，由于网络原因可能导致部分用户从服务器下载缓慢或者无法下载，现在原有基础上修改并增加离线版本请确保sed是否安装，,以下使用 on of替代 在线 离线  
ubuntu:on of ; centos:on ; alpine:of ; deepin:of ;debian:on of ;fedora:on ;arch of ;opensuse of;kali on of;  
可以使用脚本中的自动更换源默认更换为阿里云软件源  
因网易镜像站暂无kali软件源，且将网易kali软件源更改为中科大kali软件源  
使用方法:  
wget dl.lxw2004.xyz/linux/change.sh && chmod +x change.sh && ./change.sh
