/usr/bin/supervisord -c /opt/hbase/supervisor.conf

echo "Waiting for the HBase master to start on port 60010"
curl localhost:60010 &> /dev/null
rc=$?
while [[ $rc != 0 ]]
    do
        curl localhost:60010 &> /dev/null
        rc=$?
        sleep 1
    done
echo "Master has started on port 60010"

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

# don't exit from container after script ends
# while true; do nc -l -p 12345 <<< "ok" || break; done
python -m SimpleHTTPServer 12345
