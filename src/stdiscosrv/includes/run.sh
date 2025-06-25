#!/bin/ash
cd /data
stdiscosrv --http --listen=:5000 --db-dir=/data/
exit