FROM nerdammer/hbase:1.1.0.1
MAINTAINER ivan Bettarini <ivan.bettarini@gmail.com>

ADD start-pseudo-distributed-thrift.sh /opt/hbase/bin/start-pseudo-distributed-thrift.sh
ADD create_table_hbase.txt /opt/hbase/bin/create_table_hbase.txt

EXPOSE 9090

CMD /opt/hbase/bin/start-pseudo-distributed-thrift.sh
