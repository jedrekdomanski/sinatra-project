#!/bin/sh

rm -f tmp/pids/server.pid

rake db:migrate
