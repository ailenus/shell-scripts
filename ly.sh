#!/bin/bash

FILE="$1"

if [ ! -e "$FILE" ] ; then
    echo "Error: $FILE does not exist"
    exit 1
fi

FILE_NAME="${FILE%".ly"}"

/Applications/LilyPond.app/Contents/Resources/bin/lilypond "$FILE"
open -a /Applications/Preview.app/ "${FILE_NAME}.pdf"
