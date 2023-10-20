#!/usr/bin/env sh

# echo 'The following command terminates the "npm start" process using its PID'
# echo '(written to ".pidfile"), all of which were conducted when "deliver.sh"'
# echo 'was executed.'
# set -x
# kill $(cat .pidfile)

#!/bin/bash
if [ -f .pidfile ]; then
    PID=$(cat .pidfile)
    if [ -n "$PID" ]; then
        if kill -0 $PID 2>/dev/null; then
            echo "Killing process with PID $PID"
            kill $PID
        else
            echo "Process with PID $PID is not running."
        fi
    else
        echo ".pidfile is empty."
    fi
else
    echo ".pidfile not found."
fi

