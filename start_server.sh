#!/bin/bash
trap kill_server_and_exit INT

function kill_server_and_exit() {
  ps aux | grep "php -S localhost:\d\d\d\d" | awk '{print $2}' | xargs kill
  exit
}

DIR="$(dirname $0)"
cd $DIR

php -S localhost:9011 >> /dev/null &

open http://localhost:9011

echo "Pres CTRL+C to stop..."

while :
do
   sleep 1
done
