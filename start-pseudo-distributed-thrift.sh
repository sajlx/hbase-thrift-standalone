/opt/hbase/bin/hbase zookeeper > logzoo.log 2>&1 &
/opt/hbase/bin/hbase regionserver start > logregion.log 2>&1 &

/opt/hbase/bin/hbase master start --localRegionServers=0 &

/opt/hbase/bin/hbase thrift start > thrift.log 2>&1 &

# /opt/hbase/bin/hbase shell /opt/hbase/bin/create_table_hbase.txt
