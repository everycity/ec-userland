#!/bin/bash

components=`ls -1 */*.p5m */*/*.p5m */*/*/*.p5m | sed 's/\/[^/]*$//g' | sort | uniq 2>/dev/null`

com_dir=`pwd`

for component in $components ; do

	cd $com_dir/$component

	if [ "x$1" == "x--clean" ] ; then
		gmake clean > /dev/null 2>&1
	fi

	mkdir -p build

	gmake publish COMPONENT_BUILD_GMAKE_ARGS='-j 16' > build/build.log 2>&1

	if [[ $? -ne 0 ]] ; then 
		echo FAIL: $component
	else
		echo PASS: $component
		pfexec pkg update -v > /dev/null 2>&1
	fi

done
