#!bin/bash
FILE="/tmp/loadavg5"
loadavg5=$(cat /proc/loadavg | awk '{print $2}') #Берем среднюю нагрузку за 5 минут
res=$(echo $loadavg5 | cut -d. -f1) # переводит число из float в int

if (( $res >= 50 && $res < 60 ));then
        echo "-10" > $FILE
fi
if (( $res >= 60 && $res < 70 ));then
        echo "-20" > $FILE
fi
if (( $res >= 70 && $res < 80 ));then
        echo "-30" > $FILE
fi
if (( $res >= 80 && $res <= 100 ));then
        echo "-40" > $FILE
fi