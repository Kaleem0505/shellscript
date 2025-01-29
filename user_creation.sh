#!/bin/bash
# ##################################################
# Script should be run as root
if [ "$UID" -ne 0 ]; then
    echo "This script should be run as root"
    exit 1
fi
# User should provide atleast one argument as username
if [ $# -lt 1 ]; then
    echo "Usage: $0 USER_NAME [COMMENT]"
    echo "Create a user with name USER_NAME and comment as COMMENT"
exit 1
fi
# Store 1st argument as username
USER_NAME=$1

# In case of more than one argument, store it as comment
shift 
COMMENT=$*

# Create a random password

PASSWORD=$(date +%s | sha256sum | base64 | head -c 32)

# Create a user with the username and comment provided

useradd -c "${COMMENT}" -m $USER_NAME

# Check if the user is created successfully

if [ $? -eq 0 ]; then
    echo "User $USER_NAME has been created successfully"
else
    echo "Failed to create the user $USER_NAME"
    exit 1
fi

# Set the password for the user

passwd $PASSWORD $USER_NAME

# Check if the password is set successfully

if [ $? -eq 0 ]; then
    echo "Password has been set successfully for the user $USER_NAME"
else
    echo "Failed to set the password for the user $USER_NAME"
    exit 1
fi

# Force the user to change the password on login

passwd -e $USER_NAME

# Display the username, password and hostname

echo "Username: $USER_NAME"
echo "Password: $PASSWORD"
echo "Hostname: $(hostname)"

# ###################################################

# End of the script













