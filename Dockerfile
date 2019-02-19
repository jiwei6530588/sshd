#基础镜像 
FROM ubuntu:18.04
#维护者信息
MAINTAINER JIWEI 404907839@qq.com
#更新软件和安装openssh
RUN apt-get update && \
apt-get install -y openssh-server && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*
# 取消密码限制
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
#复制配置文件到相应位置
#ADD authorized_keys /root/.ssh/authorized_keys
#RUN mkdir /var/run/sshd && \
#chmod 700 /root/.ssh && \
#chmod 600 /root/.ssh/* && \
#chown -R root:root /root/.ssh && \
RUN echo root:123456.com | chpasswd
#开放端口
EXPOSE 22
#启动命令
CMD ["usr/sbin/sshd","-D"]




