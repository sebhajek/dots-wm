#!/usr/bin/env bash

mkdir -p ~/.setup-dots/fonts/out/bitmap;
cd ~/.setup-dots/fonts;
wget https://github.com/IBM/plex/releases/download/v6.4.0/OpenType.zip -O ibm-plex.zip;
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/IBMPlexMono.zip -O nerd-blex.zip;
wget https://github.com/molarmanful/eldur/releases/download/v0.0.2/eldur.otb -O out/bitmap/eldur.otp;
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette.otb -O out/bitmap/cozette.otp;
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/cozette_hidpi.otb -O out/bitmap/cozette-hidpi.otp;
wget https://github.com/slavfox/Cozette/releases/download/v.1.23.2/CozetteVector.otf -O out/bitmap/cozette-vector.otf;
mkdir -p ~/.setup-dots/fonts/out;
cd ~/.setup-dots/fonts/out/;
7z x ~/.setup-dots/fonts/ibm-plex.zip;
mv ./OpenType ./ibm-plex;
mkdir -p ~/.setup-dots/fonts/out/ibm-plex/NerdBlex;
7z x ~/.setup-dots/fonts/nerd-blex.zip -o~/.setup-dots/fonts/out/ibm-plex/Nerd-Blex;
cd ~/.setup-dots;

cp -fru ~/.setup-dots/fonts/out/* ~/.local/share/fonts/;
sudo cp -fru ~/.setup-dots/fonts/out/bitmap/* /usr/share/fonts/;
fc-cache -fv;
sudo fc-cache -f /usr/share/fonts/;