#!/bin/bash

serviceName=(apache2 nginx)
apache2="/usr/sbin/apache2"
nginx="/usr/sbin/nginx"
hostname="/usr/bin/hostname"

for service in "${serviceName[@]}"; do
    pc=$(ps -ef | grep "$service" | grep -v "$service" | wc -l)

    if [[ ${pc} -eq 0 ]]; then
        echo "Service ${service} is not running" | mailx -s "Alert: Service ${service} status" nagar.amit1999@gmail.com
    else
        echo "Service ${service} is up and running"
    fi
done
