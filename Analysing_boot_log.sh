#!/bin/bash

#defining log file

log_file="/var/log/boot.log"
#log_file=$0

#Functions to display which services are started

started_display(){
        echo -e "******** Started Services *********  \n"
        sudo grep "Started" "$log_file" | awk '{print $5 $6}'
}
started_display

