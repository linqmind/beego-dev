#!/bin/sh
sudo docker run -d -p 5432:5432 --name vshophub_db --link vshophub_dev:vshophub_dev -v ~/pgdata:/var/lib/pgsql/9.3:rw -e POSTGRESQL_USER=demo -e POSTGRESQL_PASS=demo -e POSTGRESQL_DB=demo 'cloudcube/postgresql'
