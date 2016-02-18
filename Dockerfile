FROM nerdammer/hbase:1.1.0.1
MAINTAINER ivan Bettarini <ivan.bettarini@gmail.com>

ADD start-pseudo-distributed-thrift.sh /opt/hbase/bin/start-pseudo-distributed-thrift.sh
RUN mkdir /opt/hbase/bin/initial_script
VOLUME /opt/hbase/bin/initial_script

EXPOSE 9090

CMD /opt/hbase/bin/start-pseudo-distributed-thrift.sh
ENTRYPOINT /opt/hbase/bin/start-pseudo-distributed-thrift.sh