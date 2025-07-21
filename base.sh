# git
echo "getting basic requirements..."
sudo pacman -S --needed base-devel meson ninja cmake
echo "---------------"
mkdir ~/.config

# terminal emulator
echo "getting kitty... (+ imagemagick starship fastfetch)"
sudo pacman -S kitty imagemagick starship fastfetch
echo "getting font..."
sudo pacman -S ttf-iosevkatermslab-nerd
echo "configuring kitty config..."
mkdir ~/.config/kitty
mv configs/kitty/kitty.conf ~/.config/kitty/kitty.conf
echo "--------------"

# editor
echo "getting neo/vim and packages..."
sudo pacman -S vim neovim npm unzip 7zip yazi
echo "getting neo/vim config..."
git clone https://github.com/drjam2005/nvimConfig
mv nvimConfig ~/.config/nvim
mv ~/.config/nvim/.vimrc ~/.vimrc
echo "--------------"

# yay
echo "getting yay..."
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
echo "installing yay..."
makepkg -si
cd ..
echo "yay downloaded!"
echo "---------------"

# misc
echo "misc stuff..."
mv starship/starship.toml ~/.config/starship.toml
mv fastfetch/config.jsonc ~/.config.
echo "--------------"

# tlp stuff
echo "getting tlp and acpi..."
sudo pacman -S tlp acpi
echo "starting tlp..."
sudo systemctl enable tlp
sudo systemctl start tlp
echo "-------------"

# cmus
echo "cmus stuff..."
sudo pacman -S cmus
mkdir ~/.Scripts
mv scripts/cmus_notif.sh ~/.Scripts/cmus_notif.sh
mkdir ~/Music
mv scripts/reset.sh ~/Music/reset.sh && mv scripts/dw.sh ~/Music/dw.sh

# bashrc
mv bashrc ~/.bashrc
