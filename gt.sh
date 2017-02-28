#!/bin/bash

if [ "$1" = "" ] ; then
    MSG="(this is an automatically generated commit message; "
    MSG+="the committer likely forgot to write one)"
else
    MSG="$1"
fi

git add -A
git commit -m "$MSG"
git pull origin master
git push origin master
