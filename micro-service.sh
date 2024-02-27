#!/bin/bash

domain=https://www.edvanta.com/
httpStatusCode=$(curl -s -o /dev/null -X GET -w "%{http_code}" "$domain"
echo "HTTP Status Code for $domain: $httpStatusCode"
if [[ $httpStatusCode -eq 200]]; then
        echo " micro service is running"
else:
        echo "micro service is running"
fi
