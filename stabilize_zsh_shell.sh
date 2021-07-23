#!/bin/bash

source "/opt/Symbian/functions.sh"

hide_guake
call_cmd "python3 -c 'import pty; pty.spawn(\"/bin/bash\")'"
ctrl Z
call_cmd "stty raw -echo; fg"
call_cmd "stty rows $ROWS cols $COLS"
call_cmd "export TERM=xterm-256color"
call_cmd "exec /bin/bash"
