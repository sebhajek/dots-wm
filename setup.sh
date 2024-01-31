#!/usr/bin/env fish

sudo zypper in --non-interactive grim slurp;

mkdir -p ~/setup-dots/fonts;

gh release download --pattern 'OpenType.zip' --dir ~/setup-dots/fonts -r IBM/plex;