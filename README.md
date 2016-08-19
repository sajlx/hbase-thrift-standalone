# hbase-thrift-standalone



Volumes
=======

    volumes:
      <local dir>:/opt/hbase/bin/initial_script

    here you can put hbase shell script that will be runned at startup

    (put 'exit' and new line at end of every script file)

Status server
=============

There is a supervisor running on port 9001

    username: hbase
    password: hbase


Exapmle build command
======================

    docker build -t iwan0/hbase-thrift-standalone .
    docker run -t -i -p 9001:9001 --rm iwan0/hbase-thrift-standalone

