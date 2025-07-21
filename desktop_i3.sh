# i3-wm
echo "getting i3-wm... (i3-wm xorg-server polybar feh)"
sudo pacman -S i3-wm xorg-server xorg polybar feh
echo "getting misc stuff... (rofi dunst cmus flameshot tlp qutebrowser ly)"
sudo pacman -S rofi dunst cmus flameshot tlp qutebrowser ly
echo "--------------"

# i3 config
echo "getting i3-wm config..."
git clone https://github.com/drjam2005/i3config
mv i3config ~/.config/i3 && cd ~/.config/i3
echo "-------------"

# bashrc
mv bashrc ~/.bashrc

# tlp stuff
echo "configuring tlp..."
sudo rm /etc/tlp.conf
mv tlp/tlp.conf /etc/tlp.conf
echo "starting tlp..."
sudo systemctl enable tlp
sudo systemctl start tlp

# ly stuff
echo "enabling ly..."
sudo systemctl enable ly.service
