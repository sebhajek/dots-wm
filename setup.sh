#!/usr/bin/env bash

sudo zypper -n in -tpackage --no-recommends sway-branding-upstream sway swayidle swaylock swaybg waybar dunst rofi; #swaybar
sudo zypper -n in xorg-x11 xorg-x11-server;
sudo zypper -n in -tpackage --no-recommends sddm sddm-branding-upstream;
sudo zypper -n in grim slurp;

mkdir -p ~/.config/sway;
cp -ur ~/.setup-dots/dots/wm/sway/* ~/.config/sway;
mkdir -p ~/.config/waybar;
cp -ur ~/.setup-dots/dots/wm/waybar/* ~/.config/waybar;
mkdir -p ~/.config/dunst;
cp -ur ~/.setup-dots/dots/wm/dunst/* ~/.config/dunst;
mkdir -p ~/.config/swaylock;
cp -ur ~/.setup-dots/dots/wm/swaylock/* ~/.config/swaylock;

#sudo cp -ur ~/.setup-dots/dots/wm/lightdm/* /etc/lightdm/
sudo update-alternatives --set default-displaymanager /usr/lib/X11/displaymanagers/sddm;
sudo systemctl set-default graphical.target;
sudo systemctl enable display-manager;