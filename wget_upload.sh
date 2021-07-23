#!/bin/bash

source "/opt/Symbian/functions.sh"

PORT=$(($RANDOM+3000))
filename=$(basename $1)
TMPDIR=$(mktemp -d)

hide_guake
cp $1 $TMPDIR
terminator --working-directory=$TMPDIR -e \
 "python3 -m http.server $PORT"
alt_tab
sleep 0.5
call_cmd "wget http://$IP:$PORT/$filename -O /dev/shm/$filename"
alt_tab
sleep 10
ctrl C