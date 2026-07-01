#!/bin/bash

echo "$(date) started" >> /tmp/theme-watcher-debug.log

LAST=""

while true
do
    if defaults read -g AppleInterfaceStyle 2>/dev/null | grep -q Dark
    then
        CURRENT="dark"
    else
        CURRENT="light"
    fi

    if [ "$CURRENT" != "$LAST" ]
    then
        LAST="$CURRENT"

        if [ "$CURRENT" = "dark" ]
        then
            cp ~/.tmux/tmux-dark.conf ~/.tmux/current-theme.conf
        else
            cp ~/.tmux/tmux-light.conf ~/.tmux/current-theme.conf
        fi

        /opt/homebrew/bin/tmux source-file /Users/egorsudakov/.tmux.conf
    fi

    sleep 5
done
