#!/usr/local/bin/bash
# GNU bash，版本 5.0.7(1)-release (x86_64-apple-darwin18.5.0)
if [[ $1 == 'up' ]];then
    bash ./customer-db.sh up
    bash ./stock-db.sh up
    bash ./identity-cache.sh up
fi
# sleep 10
# bash ./stock-server.sh up

if [[ $1 == 'down' ]];then
    bash ./customer-db.sh down
    bash ./stock-db.sh down
    bash ./identity-cache.sh down
fi
# bash ./stock-server.sh down