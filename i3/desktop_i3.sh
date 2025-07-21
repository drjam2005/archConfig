# i3-wm
echo "getting i3-wm... (i3-wm xorg-server polybar feh)"
sudo pacman -S i3-wm xorg-server xorg polybar feh
echo "exec i3" >> ~/.xinitrc
echo "getting misc stuff... (rofi dunst cmus flameshot qutebrowser ly)"
sudo pacman -S rofi dunst cmus flameshot tlp qutebrowser ly
echo "--------------"

# ly stuff
echo "enabling ly..."
sudo systemctl enable ly.service

# i3 config
echo "getting i3-wm config..."
git clone https://github.com/drjam2005/i3config
mv i3config ~/.config/i3 && cd ~/.config/i3
echo "-------------"

# picom
sudo pacman -S libx11 uthash libev libconfig
git clone https://github.com/yshui/picom
cd picom
meson setup --buildtype=release build
ninja -C build
ninja -C build install
