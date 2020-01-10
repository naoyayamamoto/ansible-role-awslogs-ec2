FROM amazonlinux:2

RUN yum -y update && yum -y install procps systemd-sysv && amazon-linux-extras install -y ansible2

WORKDIR /ansible-role-awslogs-ec2

CMD ["/sbin/init"]
