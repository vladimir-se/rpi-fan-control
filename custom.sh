#!/bin/sh

RUNSCRIPTNAME="fan.sh"
RUNSCRIPTPATH="/userdata/system/"

case "$1" in
  start)
    echo "Starting fan"
    ${RUNSCRIPTPATH}${RUNSCRIPTNAME} start &
    ;;
  stop)
    echo "Stopping fan"
    ${RUNSCRIPTPATH}${RUNSCRIPTNAME} stop &
    killall ${RUNSCRIPTNAME}
    #pkill -f /usr/sbin/fan.sh
    ;;
  *)
    echo "Usage: /etc/init.d/S99fancontrol {start|stop}"
    exit 1
    ;;
esac

exit 0

