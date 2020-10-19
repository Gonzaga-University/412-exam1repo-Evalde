#!/bin/bash
function userInfo {
    exist=$(cat /etc/passwd | grep "$1")
    if ["$1" == "$exist"];then
        du -sh /home/"$1"
        ls /home/"$1" | head
    fi
}

if [$# -eq 0]; then
    echo "Enter a user: "
    read user
    userInfo $user
    exit 1
elif [$# -gt 1]; then
    echo "ERROR: Too many arguments passed."
    exit 1
else
    userInfo $1
fi

