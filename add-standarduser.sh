#!/bin/bash

# This script creates an account on the local system.
# You will be prompted for the account name and password.
if [[ "${UID}" -ne 0 ]]
then
 echo 'You must have root previleges'
 exit 1
fi
# Ask for the user name.
USER_NAME="First-Name"
#read -p 'Enter the username to create: ' USER_NAME

# Ask for the real name.
COMMENT="Last-Name"
#read -p 'Enter the name of the person who this account is for: ' COMMENT

# Ask for the password.
PASSWORD="blablabla"
#read -p 'Enter the password to use for the account: ' PASSWORD

# Create the user.
useradd -c "${COMMENT}" -m ${USER_NAME}
if [[ "$?" -ne 0 ]]
then 
	echo "account is not created for ${COMMENT}"
	exit 1
else 
	echo "account is created for ${COMMENT}"
fi
# Set the password for the user.
# NOTE: You can also use the following command:
#    echo "${USER_NAME}:${PASSWORD}" | chpasswd
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# Force password change on first login.
passwd -e ${USER_NAME}

echo "User name is ${USER_NAME}"
echo "Password  is ${PASSWORD}"
echo "Host name  is ${HOSTNAME}"

exit 0 

