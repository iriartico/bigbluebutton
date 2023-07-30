#!/bin/bash

# Install BigBlueButton 2.6
echo -n "Please enter the hostname [bbb.mydomain.com]: "
read hostname

echo -n "Please enter the email address for Let's Encrypt [admin@mydomain.com]: "
read email

wget -qO- https://ubuntu.bigbluebutton.org/bbb-install-2.6.sh | bash -s -- -v focal-260 -s "$hostname" -e "$email" -g -w

# Check status of server
echo "[Server Status]"
bbb-conf --check

echo "[Services Status]"
bbb-conf --status