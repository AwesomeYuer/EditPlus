#TITLE=02.Microshaoft.Linux
#INFO
New Cliptext library
#SORT=y

#T=.NET Core
^# 重新安装一下Ubuntu子系统
lxrun /uninstall /full
lxrun /install

^# Register the trusted Microsoft signature key:
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

^# Register the Microsoft Product feed
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'

^# Install .NET SDK
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1.4

^# 先要将调试器 vsdbg 下载到子系统中运行bash
sudo apt-get install unzip
curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l ~/vsdbg

^# 安装SSH,子系统间的通信,因为系统不同还是需要安装SSH服务器, unzip 和 curl 或 wget 等组件
sudo apt-get install openssh-server unzip curl

^# 安装SSH后,系统并不能访问本机的系统的端口做通信,还需要配置一个SSH服务器的配置文件
sudo nano /etc/ssh/sshd_config

^# 分别找到如下配置项做修改,修改后的内容如下:
UsePAM no
UsePrivilegeSeparation no
PasswordAuthentication yes
^#PermitRootLogin prohibit-password
PermitRootLogin yes
Port 2222

^# generate SSH keys for the SSH instance:
sudo ssh-keygen -A

^# 最后重启下SSH服务
sudo service ssh --full-restart

^# 每次启动Bash进程时都需要重新启动SSH Service
sudo service ssh start

#