#!/bin/bash

#defining log file

log_file="/var/log/boot.log"
#log_file=$0

#Functions to display which services are started

started_display(){
        echo -e "******** Started Services *********  \n"
        sudo grep "Started" "$log_file" | awk '{print $5}'
}

count_services(){
        echo "Number of active services: "
        grep "Started" "$log_file" | wc -l
}
is_active(){
        echo "Enter a Service name:"
        read service_name

        if systemctl is-active --quiet "$service_name"; then
        echo "Service $service_name is active."

        else
        echo "Service $service_name is not active or does not exist."
        fi
}

function_of_service(){
        echo "Enter a Service name:"
        read service_name

        grep "$service_name" "$log_file" | awk '{ print substr($0, index($0, $7)) }'

}
while getopts "acflh" opt; do
    case ${opt} in
        h)
            echo "Usage: $0 [-h] [-f] [-a] [-c] [-l] "
            echo "Options:"
            echo "  -h  Display this help message"
            echo " -a Display whether the service is active"
            echo "  -f  Display Function of a service"
            echo " -l List the started services"
            echo "  -c  Display number of services started"
            exit 0
            ;;
        a) 
        is_active
        ;;

        c)
        count_services
        ;;

        f)
        function_of_service
        ;;

        l)
        started_display
        ;;
         

   esac
   done
