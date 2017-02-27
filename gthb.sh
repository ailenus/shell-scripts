#!/bin/bash

if [ "$1" = "" ] ; then
    COMMENT="default comment"
else
    COMMENT="$1"
fi

git fetch
git merge master
git add -A .
git commit -m "$COMMENT"
git push origin master
