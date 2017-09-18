#!/bin/sh

# set priority according to quantum
set -e

# default quantum priority is above all priority
DEFAULT_PRIORITY=10000

if test "x$DEFAULTQUANTUMDEPTH" = x; then
    echo "No default quantum exit" > /dev/stderr;
    exit 1;
fi

if test "x$1" = x; then
    echo "No quantum exit" > /dev/stderr;
    exit 1;
fi


QUANTUM_PART=$(set -e;echo -n "$1" | sed -r 's/q?([[:digit:]]*)(HDRI)?/\1/gi')
HDRI_STR=$(set -e;echo -n "$1" | sed -e 's/\(.*\)/\L\1/') 
HDRI=$(set -e;case "$HDRI_STR" in *hdri) echo 'yes';; *) echo 'no' ;; esac)
								       
if test "x$1" = "x$DEFAULTQUANTUMDEPTH"; then
    echo -n $DEFAULT_PRIORITY
    exit 0;
fi

# hdri is slower divide 
if test "x$HDRI" = "xyes"; then
    PRIO_OFFSET=100;
else
    PRIO_OFFSET=1000;
fi;

# larger is slower
case $QUANTUM_PART
in 8)
       BASE_PRIO=4;;
   16)
       BASE_PRIO=3;;
   32)
       BASE_PRIO=2;;
   64)
       BASE_PRIO=1;;
   *)
       echo "unknown quantum exit" > /dev/stderr;
       exit 1;
       ;;
esac

echo -n $(($BASE_PRIO*100+$PRIO_OFFSET))
			  
exit 0;
