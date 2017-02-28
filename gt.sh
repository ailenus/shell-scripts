#!/bin/bash

if [ "$1" = "" ] ; then
    MSG="(this is an automatically generated commit message; the committer "
    "likely forgot to write one)"
else
    MSG="$1"
fi

git add -A
git commit -m "$MSG"
git fetch origin
git merge master
git push origin master
