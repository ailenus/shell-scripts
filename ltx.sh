#!/bin/bash

FILE="$1"
BIB="$2"

if [ ! -e "$FILE" ] ; then
    echo "Error: $FILE does not exist"
    exit 1
fi

FILE_NAME="${FILE%".tex"}"

latex "$FILE"
if [ "$BIB" = "b" ] ; then
    bibtex "$FILE_NAME"
fi
latex "$FILE"
latex "$FILE"
dvipdf "${FILE_NAME}.dvi"
rm "${FILE_NAME}.aux"
rm "${FILE_NAME}.log"
rm "${FILE_NAME}.dvi"
if [ "$BIB" = "b" ] ; then
    rm "${FILE_NAME}.blg"
fi
open "${FILE_NAME}.pdf"
