FROM centos:centos7

RUN yum -y install http://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm && \
    yum -y install epel-release \
                   yum-plugin-priorities && \
    yum -y install cronie && \
    yum -y install osg-ca-certs && \
    yum -y install lcmaps lcmaps-db-templates xrootd-lcmaps vo-client vo-client-lcmaps-voms && \
    yum -y install xrootd-server && \
    yum -y install openssl && \
    yum -y install supervisor

RUN yum -y install xrootd-macaroons --enablerepo=osg-contrib

ADD fetch-crl-kubernetes /etc/cron.d/fetch-crl-kubernetes
ADD fix_certs.sh /usr/local/sbin/fix_certs.sh

RUN adduser tpcuser

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"] 