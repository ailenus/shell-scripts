#!/bin/bash

COMMENT="$1"

git fetch
git merge master
git add -A .
git commit -m "$COMMENT"
git push origin master
