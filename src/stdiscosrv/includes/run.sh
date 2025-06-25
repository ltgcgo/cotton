#!/bin/ash
cd /data
stdiscosrv --debug --http --listen=:5000 --db-dir=/data/
exit