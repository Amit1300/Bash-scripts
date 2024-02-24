#!/bin/bash

installpkg(){

        reqpkg=${1}

        if command -v ${reqpkg} 1>/dev/null 2>&1; then
                echo "{reqpkg} is already deployed"
        else
                echo " installling ${reqpkg}"
                apt-get install ${reqpkg}
        fi


}


installpkg apache2
