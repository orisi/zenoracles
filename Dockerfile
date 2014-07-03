FROM ubuntu:12.04
MAINTAINER Kuba Kucharski <kuba@zenmakers.co>


RUN apt-get update
RUN apt-get install -y git screen python-pip joe openssh-server
RUN echo 'root:screencast' |chpasswd
RUN chmod 777 /var/run/screen
RUN mkdir /var/run/sshd

WORKDIR /tmp

RUN git clone  https://github.com/orisi/orisi.git
RUN chmod +x ./orisi/docker_install.sh
RUN ./orisi/docker_install.sh

EXPOSE 22 8333 8444 2523


CMD ["/usr/bin/supervisord"]
#CMD    ["/usr/sbin/sshd", "-D"]

