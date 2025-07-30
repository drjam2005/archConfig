# git
echo "getting basic requirements..."
sudo pacman -S --needed git base-devel meson ninja cmake
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

if [ $1 != "nightlyNvim" ]; then
    echo "getting neo/vim and packages..."
    sudo pacman -S neovim vim npm unzip 7zip yazi
    echo "getting neo/vim config..."
    git clone https://github.com/drjam2005/nvimConfig
    rm -r ~/.config/yazi
    mv yazi ~/.config/.
    rm -r ~/.config/nvim
    mv nvimConfig ~/.config/nvim
    rm ~/.vimrc
    mv ~/.config/nvim/.vimrc ~/.vimrc
fi

# yay
echo "getting yay..."
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
echo "installing yay..."
makepkg -si
cd ..
echo "yay downloaded!"
echo "---------------"

if [ $1 = "nightlyNvim" ]; then
    yay -S neovim-nightly-bin
    echo "getting (nightly) neo/vim and packages..."
    sudo pacman -S vim npm unzip 7zip yazi
    echo "getting (nightly) neo/vim config..."
    git clone -b nightlyConfig https://github.com/drjam2005/nvimConfig
    rm -r ~/.config/yazi
    mv yazi ~/.config/.
    rm -r ~/.config/nvim
    mv nvimConfig ~/.config/nvim
    rm ~/.vimrc
    mv ~/.config/nvim/.vimrc ~/.vimrc
    echo "--------------"
fi

# misc
echo "misc stuff..."
mv starship/starship.toml ~/.config/starship.toml
mkdir ~/.config/fastfetch
mv configs/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
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
sudo pacman -S cmus yt-dlp id3v2 ffmpeg
mkdir ~/.config/cmus
mv configs/cmus/rose-pine.theme ~/.config/cmus/.
mkdir ~/.Scripts
mv scripts/cmus_notif.sh ~/.Scripts/cmus_notif.sh
mkdir ~/Music
mv scripts/reset.sh ~/Music/reset.sh && mv scripts/dw.sh ~/Music/dw.sh

# bashrc
mv scripts/.bashrc ~/.bashrc

