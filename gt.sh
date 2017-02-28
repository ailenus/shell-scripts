#!/bin/bash

if [ "$1" = "" ] ; then
    MSG="(empty commit message)"
else
    MSG="$1"
fi

git add -A
git commit -m "$MSG"
git pull origin master
git push origin master
