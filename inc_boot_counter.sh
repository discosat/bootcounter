#!/bin/bash
BOOT_COUNTER_FILE=/home/mendel/boot_counter.txt
LAST_LINE=`tail -n 1 $BOOT_COUNTER_FILE`
NUM_LINES=`wc -l < $BOOT_COUNTER_FILE`

if (($NUM_LINES >= 10))
then
        sed -i '1d' $BOOT_COUNTER_FILE
fi

NUM_CHARS=`wc -c < $BOOT_COUNTER_FILE`

if (($NUM_CHARS < 2))
then
        rm -f $BOOT_COUNTER_FILE
        touch $BOOT_COUNTER_FILE
        echo 0 $(uptime -s) > $BOOT_COUNTER_FILE
else
        LAST_BOOT_COUNT=${LAST_LINE%% *}
        echo $(($LAST_BOOT_COUNT + 1 ))  $(uptime -s) >> $BOOT_COUNTER_FILE
fi
