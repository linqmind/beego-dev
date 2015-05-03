#!/bin/sh
sudo docker run -d -p 5432:5432 --name postgresql -v /home/core/data/db:/var/lib/pgsql/9.3:rw -e POSTGRESQL_USER=demo -e POSTGRESQL_PASS=demo -e POSTGRESQL_DB=demo 'cloudcube/postgresql'
