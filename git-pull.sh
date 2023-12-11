#!/usr/bin/env sh
res=$(git pull 2>&1)
if [ $? -eq 0 ]; then
    notify-send "Pulled successfully"
else
    notify-send "Pull failed: $res"
fi
