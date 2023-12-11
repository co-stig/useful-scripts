#!/usr/bin/env sh
git status > /tmp/git-status.txt
kdialog --textbox /tmp/git-status.txt 550 550
if [ $? -eq 0 ]; then
    msg=$(kdialog --inputbox "Enter commit message")
    if [ $? -eq 0 ]; then
        res=$(git commit -m "$msg" 2>&1)
        if [ $? -eq 0 ]; then
            res=$(git push 2>&1)
            if [ $? -eq 0 ]; then
                notify-send "Pushed successfully"
            else
                notify-send "Failed to push: $res"
            fi
        else
            notify-send "Failed to commit: $res"
        fi
    fi
fi
