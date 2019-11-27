#!/bin/bash
ABS_SCRIPT_DIR=$(cd "$(dirname "$0")"; pwd -P )

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "$ABS_SCRIPT_DIR" >> /etc/paths
echo "Added $ABS_SCRIPT_DIR to /etc/paths"

