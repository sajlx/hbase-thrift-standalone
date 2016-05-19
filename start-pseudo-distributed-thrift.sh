
sh /opt/hbase/bin/hbase-daemon.sh autorestart zookeeper
sh /opt/hbase/bin/start-hbase.sh
# /opt/hbase/bin/hbase zookeeper > logzoo.log 2>&1 &
# /opt/hbase/bin/hbase master start --localRegionServers=0 > master.log 2>&1 &
# /opt/hbase/bin/hbase regionserver start > logregion.log 2>&1 &

echo 'Checking master status on port 60010 '
curl localhost:60010
rc=$?
while [[ $rc != 0 ]]
    do
        echo 'Checking master status on port 60010 result $rc'
        curl localhost:60010
        rc=$?
    done
echo 'GOOD checking master status on port 60010 $rc'

DIR=/opt/hbase/bin/initial_script
TMP_ALL=/*

if [ "$(ls -A $DIR)" ];
    then
        echo "$DIR is NOT Empty"
        for FILE_SCRIPT in $DIR$TMP_ALL; do
            echo "Executing $FILE_SCRIPT hbase script..."
            /opt/hbase/bin/hbase shell $FILE_SCRIPT
            echo "Ended executing $FILE_SCRIPT hbase script..."
            echo
        done
    else
        echo "$DIR is Empty"
fi


sh /opt/hbase/bin/hbase-daemon.sh autorestart thrift
# /opt/hbase/bin/hbase thrift start > thrift.log 2>&1 &

# don't exit from container after script ends
while true; do nc -l -q 0 -p 12345 <<< "ok" || break; done
