#!/usr/bin/env fish

sudo zypper -n in grim slurp;

mkdir -p ~/setup-dots/fonts;
cd ~/setup-dots/fonts;
wget https://github.com/IBM/plex/releases/download/v6.4.0/OpenType.zip -O ibm-plex.zip;
cd ~/setup-dots;