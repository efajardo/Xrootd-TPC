FROM centos:centos7

RUN yum -y install http://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm && \
    yum -y install epel-release \
                   yum-plugin-priorities && \
    yum -y install cronie && \
    yum -y install osg-ca-certs && \
    yum -y install xrootd-server --enablerepo=osg-testing && \
    yum -y install iperf3 &&\
    yum -y install supervisor

ADD fetch-crl-kubernetes /etc/cron.d/fetch-crl-kubernetes
ADD fix_certs.sh /usr/local/sbin/fix_certs.sh
# Dekuberntizie it to be pretty much docker only
ADD xrootd-third-party-copy.cfg /etc/xrootd/xrootd-third-party-copy.cfg
RUN chown xrootd:xrootd /etc/xrootd/xrootd-third-party-copy.cfg
RUN adduser tpcuser

RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisord.conf
EXPOSE 9002
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"] 