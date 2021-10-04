# syntax=docker/dockerfile:1
FROM ubuntu
RUN echo "y" | unminimize
RUN apt install -y apt-utils
RUN apt install -y tcpdump
RUN apt install -y python3 less nano sudo
RUN apt install -y netcat iproute2 net-tools
RUN apt install -y iputils-ping traceroute openssh-server
VOLUME /shared
WORKDIR /root
EXPOSE 22
EXPOSE 2345/tcp
EXPOSE 2345/udp
RUN echo 'PS1="\[$(tput setaf 3)$(tput bold)[\]root@$(hostname -I|xargs)$:\\w]#\[$(tput sgr0) \]"' >> /root/.bashrc
RUN useradd -m -p $(openssl passwd -1 "user") user
RUN usermod -a -G sudo user
RUN echo 'PS1="\[$(tput setaf 5)$(tput bold)[\]user@$(hostname -I|xargs)$:\\w]$\[$(tput sgr0) \]"' >> /home/user/.bashrc
RUN mkdir /run/sshd
COPY entrypoint.sh /root/entrypoint.sh
ENTRYPOINT /root/entrypoint.sh
