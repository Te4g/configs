#!/bin/bash
DOCKER_COMPOSE_VERSION="1.29.2"
PHP_VERSION="8.1"
GO_VERSION="1.17"

if [ "$(whoami)" != "root" ]; then
    SUDO=sudo
fi

###> SNAP RELATED ###
${SUDO} apt install \
  snapd \
  curl \
  podman

echo 'PATH="$PATH:/snap/bin"' >> ~/.bashrc

${SUDO} snap install \
  phpstorm --classic \
  codium --classic
###< SNAP RELATED ###

###> DOCKER-COMPOSE RELATED ###
${SUDO} curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
${SUDO} chmod +x /usr/local/bin/docker-compose
###< DOCKER-COMPOSE RELATED ###

###> PHP RELATED ###
${SUDO} apt -y install apt-transport-https lsb-release ca-certificates curl
${SUDO} wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
${SUDO} sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
${SUDO} apt update
${SUDO} apt -y install php${PHP_VERSION} php${PHP_VERSION}-mbstring
###< PHP RELATED ###

###> COMPOSER RELATED ###
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
${SUDO} mv composer.phar /usr/local/bin/composer
###< COMPOSER RELATED ###

###> GO RELATED ###
wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz
${SUDO} tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
rm go${GO_VERSION}.linux-amd64.tar.gz
echo 'PATH="$PATH:/usr/local/go/bin"' >> ~/.bashrc
###< GO RELATED ###

###> SYSTEM RELATED ###
${SUDO} apt install bat
###< SYSTEM RELATED ###
