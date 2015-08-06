# Version : 0.0.1

FROM ubuntu:14.04

MAINTAINER Aaron McGrouther "mcgroac1@student.op.ac.nz"

RUN apt-get -y update

RUN apt-get -y upgrade

RUN apt-get -y install openssh-server

RUN apt-get -y install apache2

RUN apt-get -y install supervisor

RUN mkdir -p /var/run/sshd /var/lock/apache2 /var/run/apache2 /var/log/supervisor

RUN useradd -m -G sudo user

RUN echo 'user:P@ssw0rd' | chpasswd

COPY supervisord.conf /etc/supervisor/conf.d.supervisord.conf

EXPOSE 22

EXPOSE 80

CMD ["/usr/bin/supervisord"]
