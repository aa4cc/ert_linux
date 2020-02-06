#!/bin/sh

IPADDR=$2
LOGIN=$3
unset LD_LIBRARY_PATH
if [ -e target-ssh-key ] ; then
  SSH_LOCAL_KEY_OPT="-i target-ssh-key"
fi

xterm -e "scp $SSH_LOCAL_KEY_OPT ./$1 $LOGIN@$IPADDR:/tmp ; echo model $1 copied to target is run ; ssh $SSH_LOCAL_KEY_OPT $LOGIN@$IPADDR /tmp/$1 -tf inf -w ; sleep 2" &