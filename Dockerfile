FROM amazonlinux:2

RUN yum -y update && yum -y install procps systemd-sysv

CMD ["/sbin/init"]