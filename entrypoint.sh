#!/bin/sh

rm -f tmp/pids/server.pid
rake db:create
rake db:migrate

rackup --host 0.0.0.0 -p 4567
