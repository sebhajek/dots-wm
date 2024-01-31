#!/usr/bin/env fish

sudo zypper -n in grim slurp;

mkdir -p ~/setup-dots/fonts;
gh release download --pattern 'OpenType.zip' --dir ~/setup-dots/fonts -R IBM/plex;