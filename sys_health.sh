#!/bin/bash
# This script will help to monitor the system health
# Author- Kalemudeen
# Usage: ./sys_health.sh

set -x # To debug the script
set -e # To exit the script if any command fails
set -o pipefail # To exit the script if any command in the pipe fails

# To check the Storage

df -h

# To check the Memory

free -h

# To check the no of CPU

nproc

# To check the Processes

ps -ef

# End of the script

