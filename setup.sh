#!/usr/bin/env fish

sudo zypper -n in grim slurp;

mkdir -p ~/.setup-dots/fonts/out/bitmap;
cd ~/.setup-dots/fonts;
wget https://github.com/IBM/plex/releases/download/v6.4.0/OpenType.zip -O ibm-plex.zip;
wget https://github.com/molarmanful/eldur/releases/download/v0.0.2/eldur.otb -O out/bitmap/eldur.otp;
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette.otb -O out/bitmap/cozette.otp;
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette_hidpi.otb -O out/bitmap/cozette-hidpi.otp;

mkdir -p ~/.setup-dots/fonts/out;
cd ~/.setup-dots/fonts/out/;
7z x ~/.setup-dots/fonts/ibm-plex.zip;
mv ./OpenType ./ibm-plex;
cd ~/.setup-dots;