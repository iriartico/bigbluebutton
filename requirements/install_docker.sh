#!/bin/bash

# Install a few prerequisite packages which let apt use packages over HTTPS
apt install apt-transport-https ca-certificates curl software-properties-common -y

# Add the GPG key for the official Docker repository
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add the Docker repository to APT sources
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Finally, install Docker
apt install docker-ce docker-compose -y
