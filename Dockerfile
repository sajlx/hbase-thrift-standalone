FROM nerdammer/hbase:1.1.0.1
MAINTAINER ivan Bettarini <ivan.bettarini@gmail.com>

ADD hbase-site.xml /opt/hbase/conf/hbase-site.xml

ADD start-pseudo-distributed-thrift.sh /opt/hbase/bin/start-pseudo-distributed-thrift.sh
RUN yum install -y nmap
RUN yum install -y nc
RUN chmod +x /opt/hbase/bin/start-pseudo-distributed-thrift.sh
RUN mkdir /opt/hbase/bin/initial_script
VOLUME /opt/hbase/bin/initial_script

EXPOSE 9090
EXPOSE 12345

CMD /opt/hbase/bin/start-pseudo-distributed-thrift.sh
