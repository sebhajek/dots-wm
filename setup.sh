#!/usr/bin/env fish

sudo zypper -n in grim slurp;

mkdir -p ~/.setup-dots/fonts/bitmap;
cd ~/.setup-dots/fonts;
wget https://github.com/IBM/plex/releases/download/v6.4.0/OpenType.zip -O ibm-plex.zip;
wget https://github.com/molarmanful/eldur/releases/download/v0.0.2/eldur.otb -O bitmap/eldur.otp;
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette.otb -O bitmap/cozette.otp;
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette_hidpi.otb -O bitmap/cozette-hidpi.otp;

mkdir -p ~/.setup-dots/fonts/ibm-plex;
cd ~/.setup-dots/fonts/ibm-plex;
7z x ~/.setup-dots/fonts/ibm-plex.zip;
cd ~/.setup-dots;