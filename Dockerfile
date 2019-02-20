#基础镜像 
FROM ubuntu:18.04
#维护者信息
MAINTAINER JIWEI 404907839@qq.com
#添加源
ADD run.sh /run.sh
ADD sources.list /etc/apt/sources.list
#更新软件和安装openssh
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get clean && \
    mkdir -p /var/run/sshd && \
    echo root:123456.com | chpasswd && \
    chmod 755 /run.sh
# 取消密码限制
RUN sed -ri 's/UsePAM yes/#UsePAM no/g' /etc/ssh/sshd_config && \
    sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
#复制配置文件到相应位置


#开放端口
EXPOSE 22
#启动命令
CMD ["/run.sh"]




