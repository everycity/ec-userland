#!/bin/sh
# DESC: SMF method definitions/wrapper for NRPE.
# VERSION: $id$
#
# Distributed under the BSD License.
#    
# Copyright (c) 2007 DigiTar
# All Rights Reserved
#
#    Redistribution and use in source and binary forms, with or without modification, 
#    are permitted provided that the following conditions are met:
#
#        * Redistributions of source code must retain the above copyright notice,
#          this list of conditions and the following disclaimer.
#        * Redistributions in binary form must reproduce the above copyright notice, 
#          this list of conditions and the following disclaimer in the documentation 
#          and/or other materials provided with the distribution.
#        * Neither the name of DigiTar nor the names of its contributors may be
#          used to endorse or promote products derived from this software without 
#          specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
# SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, 
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
# TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING 
# IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
# SUCH DAMAGE.
#

. /lib/svc/share/smf_include.sh

PREFIX=/ec
ETC=${PREFIX}/etc
BIN=${PREFIX}/bin
PID_FILE=/var/run/nrpe.pid

nrpe_daemon="$BIN/nrpe -c $ETC/nrpe.cfg -d"

[ -f "$BIN/nrpe" ] || exit $SMF_EXIT_ERR_FATAL


case "$1" in
	start)
        $nrpe_daemon
        if test "$?" = "0" 
        then
            exit $SMF_EXIT_OK
        elif test "$?" = "2"
        then
            echo "$ETC/nrpe.cfg does not exist. NRPE cannot be started without a configuration file."
            exit $SMF_EXIT_ERR_FATAL
        else
            echo "An unexpected error occured while trying to start NRPE."
            exit $SMF_EXIT_ERR_FATAL
        fi  
	;;		

	refresh)
        kill -HUP `cat $PID_FILE`      # Send a SIGHUP to the NRPE process
	if test "$?" = "0" 
        then
            echo "NRPE configuration succesfully reloaded."
            exit $SMF_EXIT_OK
        else
            echo "An unexpected error occured while instructing NRPE to reload its configuration. Is the NRPE process running?"
            exit $SMF_EXIT_ERR_FATAL
        fi
    ;;		
esac

exit $SMF_EXIT_OK
