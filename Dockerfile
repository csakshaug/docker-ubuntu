FROM       ubuntu:16.04
MAINTAINER Christian Saksahug "https://github.com/csakshaug"

RUN apt-get update && apt-get upgrade -y && apt-get install -y openssh-server unzip curl vim git && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN echo 'root:passw0rd' | chpasswd

EXPOSE 22

CMD  ["/usr/sbin/sshd", "-D"]
