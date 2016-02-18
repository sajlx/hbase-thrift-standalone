/opt/hbase/bin/hbase zookeeper > logzoo.log 2>&1 &
/opt/hbase/bin/hbase regionserver start > logregion.log 2>&1 &

/opt/hbase/bin/hbase master start --localRegionServers=0 > master.log 2>&1 &

/opt/hbase/bin/hbase thrift start > thrift.log 2>&1 &

# /opt/hbase/bin/hbase shell /opt/hbase/bin/create_table_hbase.txt


DIR=/opt/hbase/bin/initial_script
TMP_ALL=/*

if [ "$(ls -A $DIR)" ];
    then
        echo "$DIR is NOT Empty"
        sleep 10
    else
        echo "$DIR is Empty"
fi

for FILE_SCRIPT in $DIR$TMP_ALL; do
    echo "Executing $FILE_SCRIPT hbase script..."
    /opt/hbase/bin/hbase shell $FILE_SCRIPT
    echo "Ended executing $FILE_SCRIPT hbase script..."
    echo
done

# don't exit from container after script ends
while :; do
  sleep 300
done
