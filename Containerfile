FROM registry.access.redhat.com/ubi7/ubi
MAINTAINER jpomares

USER root
RUN yum -y update && yum -y install httpd && yum -y clean all
RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf


ADD paint.tar /var/www/html

EXPOSE 8080

RUN chgrp -R 0 /var/log/httpd /var/run/httpd && chmod -R g=u /var/log/httpd /var/run/httpd

#USER apache
USER 1001

CMD ["httpd","-D","FOREGROUND"]
