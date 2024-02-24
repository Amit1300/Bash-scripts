#!/bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <toolname>"
    exit 1
fi

toolname=${1}

# Check if the tool is installed
if ! command -v ${toolname} 1>/dev/null 2>&1; then
    echo "Error: ${toolname} not installed."
    exit 1
fi

case ${toolname} in
    apache2)
        version=$(apache2 -v 2>&1 | cut -d "/" -f2 | head -1 | cut -d " " -f1)
        ;;
    nginx)
        version=$(nginx -v 2>&1 | cut -d "/" -f2)
        ;;
    *)
        echo "Error: Unknown tool - ${toolname}"
        exit 1
        ;;
esac

# Send an email with multiline content
cat <<EOF | mailx -s "DevOps Mail - Tool Version" nagar.amit1999@gmail.com
Hello,

The version of ${toolname} is: ${version}

Best regards,
DevOps Team
EOF
