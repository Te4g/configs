#!/bin/bash
sudo apt install \
  snapd

echo 'PATH="$PATH:/snap/bin"' >> ~/.bashrc

sudo snap install \
  phpstorm --classic \
  codium --classic
  

