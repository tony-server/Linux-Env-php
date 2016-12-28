# 安装开发工具 通过yum grouplist 来查看有哪些软件包
yum groupinstall -y "Development Tools"


#bash tab自动补全
yum install bash-completion
source /etc/bash_completion

# 系统内核优化
vi /etc/sysctl.conf

# 使配置生效
/sbin/sysctl -p 
