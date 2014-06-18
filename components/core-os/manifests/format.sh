#!/bin/bash

if [[ "x$1" == "x" ]] ; then
  echo "Error: Please specify a manifest as the argument"
  exit 1
fi

if ! [[ -f $1 ]] ; then
  echo "Error: $1 is not a file"
  exit 1
fi

inputfile="$1"

fmtfile=`mktemp`

cp $inputfile $fmtfile

pkgfmt -u $fmtfile

echo $fmtfile

