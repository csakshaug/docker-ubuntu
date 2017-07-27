FROM       ubuntu:16.04
MAINTAINER Christian Sakshaug "https://github.com/csakshaug"

RUN apt-get update && apt-get upgrade -y && apt-get install -y software-properties-common iputils-ping screen tmux openssh-client openssh-server unzip curl vim git python-pip && apt-add-repository -y ppa:ansible/ansible && apt-get update && apt-get install ansible -y && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip && pip install python-consul

RUN mkdir /var/run/sshd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN echo 'root:passw0rd' | chpasswd

EXPOSE 22
