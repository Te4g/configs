#!/bin/bash
sudo apt install \
  snapd

echo 'PATH="$PATH:/snap/bin"' >> ~/.profile ## reboot is required for it to be applied 'source ~/.profile' can temporarily do the trick

sudo snap install \
  phpstorm --classic
  

