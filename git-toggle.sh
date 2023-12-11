#!/usr/bin/env sh
f=$1
git diff --cached --quiet "$f"
if [ $? -eq 0 ]; then
    # File is not staged -- add it
    res=$(git add "$f" 2>&1)
    if [ $? -eq 0 ]; then
        notify-send "Staged $f successfully"
    else
        notify-send "Failed to stage $f: $res"
    fi
else
    # File is staged -- restore it
    res=$(git restore --staged "$f" 2>&1)
    if [ $? -eq 0 ]; then
        notify-send "Restored $f successfully"
    else
        notify-send "Failed to restore $f: $res"
    fi
fi
