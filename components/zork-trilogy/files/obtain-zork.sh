#!/bin/bash

# The Zork games are freely available to download however the license
# terms forbid redistributing them. Therefore this script downloads
# them directly from the Infocom website.

zorks="zork1.zip zork2.zip zork3.zip"
url="http://www.csd.uwo.ca/Infocom/Download/"
ZCODE_DIR=/ec/share/games/zcode

# Bail out if game is already present
[[ -f ${ZCODE_DIR}/ZORK1.DAT ]] && [[ -f ${ZCODE_DIR}/ZORK1.DAT ]] && [[ -f ${ZCODE_DIR}/ZORK1.DAT ]] && exit 0

# Check to see if we are root
UUID=`id -u`

if [[ $UUID -ne 0 ]] ; then
  echo "#######################################################################"
  echo "# The Zork games are free to download and run, but the license        #"
  echo "# forbids redistributing the files. Therefore we have provided a      #"
  echo "# script to download them. Simply run the following command as root:  #"
  echo "#                                                                     #"
  echo "# /ec/share/games/zcode/obtain-zork.sh                                #"
  echo "#                                                                     #"
  echo "#######################################################################"
  echo
  exit 1
fi

tempdir=`mktemp -d`


cd $tempdir

echo "####################################################"
for zork in $zorks ; do
  echo "# Downloading $zork                            #"

  wget -q ${url}${zork}
  [[ $? -ne 0 ]] && echo "Error: Unable to download zork1 - exiting" && exit 1

  yes | unzip $zork > /dev/null 2>&1
done
echo "####################################################"
echo

echo Copying games into /ec/share/games/zcode/
cp -f DATA/* ${ZCODE_DIR}/
[[ $? -ne 0 ]] && echo "Error: Unable to copy games into place" && exit 1

rm -rf $tempdir

echo Complete

