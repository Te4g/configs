#!/bin/bash
sudo apt install \
  snapd \
  curl \
  podman

echo 'PATH="$PATH:/snap/bin"' >> ~/.bashrc

sudo snap install \
  phpstorm --classic \
  codium --classic

###> DOCKER-COMPOSE RELATED ###
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
###< DOCKER-COMPOSE RELATED ###

