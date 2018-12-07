#!/bin/bash
#####################################################################################
#                                                                                   #
#  Esegue tutti gli script di configurazione in cascata                             #
#                                                                                   #
#####################################################################################

PROFILE_NAME=${PROFILE_NAME:-"AppSrv01"}

scriptFile="/scripts/$1"

test -r "$scriptFile" || { echo "Script file $scriptFile not found. Aborting"; exit 1;}
echo "Applying script $1"

/opt/IBM/WebSphere/AppServer/profiles/$PROFILE_NAME/bin/wsadmin.sh \
     -lang jython \
     -conntype NONE \
     -f "$scriptFile"


