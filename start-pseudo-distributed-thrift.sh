/opt/hbase/bin/hbase zookeeper > logzoo.log 2>&1 &
/opt/hbase/bin/hbase regionserver start > logregion.log 2>&1 &

/opt/hbase/bin/hbase master start --localRegionServers=0 > master.log 2>&1 &

sleep 10

/opt/hbase/bin/hbase thrift start > thrift.log 2>&1 &

DIR=/opt/hbase/bin/initial_script
TMP_ALL=/*

if [ "$(ls -A $DIR)" ];
    then
        echo "$DIR is NOT Empty"
        echo 'Checking master status on port 60010 '
        curl localhost:60010
        rc=$?
        while [[ $rc != 0 ]]
            do
                echo 'Checking master status on port 60010 result $?'
                curl localhost:60010
                rc=$?
            done
        echo 'GOOD checking master status on port 60010 $?'
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
