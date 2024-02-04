#!/usr/bin/env bash

sudo zypper -n in -tpackage --no-recommends sway-branding-upstream sway swayidle swaylock swaybg waybar dunst rofi; #swaybar
sudo zypper -n in -tpackage --no-recommends greetd gtkgreet cage;
sudo zypper -n in grim slurp;

mkdir -p ~/.config/sway;
cp -ur ~/.setup-dots/dots/wm/sway/* ~/.config/sway;
mkdir -p ~/.config/waybar;
cp -ur ~/.setup-dots/dots/wm/waybar/* ~/.config/waybar;
mkdir -p ~/.config/dunst;
cp -ur ~/.setup-dots/dots/wm/dunst/* ~/.config/dunst;
mkdir -p /etc/sway/config.d;
mkdir -p /etc/greetd/;
cp -ur ~/.setup-dots/dots/wm/greetd/* /etc/greetd/;

sudo useradd -M -G video greeter;
sudo chmod -R go+r /etc/greetd/;
sudo systemctl enable --now greetd;