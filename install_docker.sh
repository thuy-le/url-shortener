#!/usr/bin/env bash
# this script will try to install docker engine and docker compose on a ubuntu xenial server
sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates -y \
&& sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D \
&& sudo apt-get update \
&& sudo echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" >> /etc/apt/sources.list.d/docker.list \
&& sudo apt-get purge lxc-docker && apt-cache policy docker-engine \
&& sudo apt-get update && sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual -y \
&& sudo apt-get update && sudo apt-get install docker-engine -y && sudo service docker start \
&& sudo usermod -aG docker ${USER} \
&& sudo apt-get update && sudo apt-get install -y build-essential libssl-dev \
&& curl -L "https://github.com/docker/compose/releases/download/1.8.1/docker-compose-$(uname -s)-$(uname -m)" > /usr/local/bin/docker-compose \
&& chmod +x /usr/local/bin/docker-compose
