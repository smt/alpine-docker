#!/bin/sh

DAEMON=/usr/sbin/motsognir
MOTSOGNIR_CONFIGFILE=${MOTSOGNIR_CONFIGFILE:-"/etc/motsognir.conf"}
LOGFILE=/var/log/motsognir.log

touch $LOGFILE

$DAEMON --config $MOTSOGNIR_CONFIGFILE > $LOGFILE

tail -f $LOGFILE
