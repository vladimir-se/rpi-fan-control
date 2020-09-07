#!/bin/sh

fan_pin=164
min_temp=55
max_temp=60

if [[ "$1" -eq "start" ]]; then
    while : ; do
        if [[ ! -e "/sys/class/gpio/gpio${fan_pin}" ]]; then
            echo "$fan_pin" > /sys/class/gpio/export
            echo "out" > "/sys/class/gpio/gpio${fan_pin}/direction"
        fi
        
	    cpu_temp=$(</sys/class/thermal/thermal_zone0/temp)
	    cpu_temp=$((cpu_temp/1000))
		    
	    #echo "Temperature: $cpu_temp"
	    if [[ "$cpu_temp" -ge "$max_temp" ]]; then
            #echo "Fan started."
            echo "1">/sys/class/gpio/gpio${fan_pin}/value
            
        elif [[ "$cpu_temp" -le "$min_temp" ]]; then
            #echo "Fan stopped."
            echo "0">/sys/class/gpio/gpio${fan_pin}/value
        fi
        sleep 30
    done
fi

if [[ "$1" -eq "stop" ]]; then
    echo "0">/sys/class/gpio/gpio${fan_pin}/value
fi

exit 0

