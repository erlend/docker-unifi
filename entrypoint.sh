#!/bin/bash

jar_file=/usr/lib/unifi/lib/ace.jar

if [ ${1:0:1} = '-' ]; then
    set -- dumb-init java $@ -XX:-PrintWarnings -jar $jar_file start
fi

exec $@
