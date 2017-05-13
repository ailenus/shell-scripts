#!/bin/bash

FILE="$1"
BIB="$2"

if [ ! -e "$FILE" ] ; then
    echo "Error: $FILE does not exist"
    exit 1
fi

FILE_NAME="${FILE%".tex"}"

pdflatex "$FILE"
if [ "$BIB" = "b" ] ; then
    bibtex "$FILE_NAME"
fi
pdflatex "$FILE"
pdflatex "$FILE"

rm "${FILE_NAME}.aux"
rm "${FILE_NAME}.log"

if [ "$BIB" = "b" ] ; then
    rm "${FILE_NAME}.blg"
fi

if [ -e "${FILE_NAME}.toc" ] ; then
    rm "${FILE_NAME}.toc"
fi
if [ -e "${FILE_NAME}.out" ] ; then
    rm "${FILE_NAME}.out"
fi
if [ -e "${FILE_NAME}.nav" ] ; then
    rm "${FILE_NAME}.nav"
fi
if [ -e "${FILE_NAME}.snm" ] ; then
    rm "${FILE_NAME}.snm"
fi

mv "${FILE_NAME}.pdf" "${FILE_NAME}-save.pdf"
open "${FILE_NAME}-save.pdf"
