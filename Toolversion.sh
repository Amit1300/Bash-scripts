#!/bin/bash

toolname=${1}

if [[ $# -ne 1 ]];then
        echo " script need input"
        exit 1
fi

command -v ${toolname} 1>/dev/null 2>&1

case ${toolname} in
        apache2 )
                apache2 -v 2>&1| cut -d "/" -f2 | head -1 | cut -d " " -f1
                ;;
        nginx )
                nginx -v 2>&1 | cut -d "/" -f2
                ;;
        *)
                echo " not present"
