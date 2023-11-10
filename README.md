# Installation

## Pre-install
### Move the config folders
```bash
sudo cp -r .config/* $HOME/.config/
sudo chown -R $USER:$USER $HOME/.config/
```

### Install Jetbrains NerdFont
```bash
sudo mkdir -p /usr/local/share/fonts/jetbrains-nf-mono

sudo wget 'https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip' -P /tmp/jetbrains-nf-mono
sudo unzip /tmp/jetbrains-nf-mono/JetBrainsMono.zip -d /tmp/jetbrains-nf-mono/
sudo cp /tmp/jetbrains-nf-mono/*.ttf /usr/local/share/fonts/jetbrains-nf-mono

sudo chown -R root: /usr/local/share/fonts/jetbrains-nf-mono
sudo chmod 644 /usr/local/share/fonts/jetbrains-nf-mono/*
sudo restorecon -vFr /usr/local/share/fonts/jetbrains-nf-mono

sudo fc-cache -v
```

# Needed packages
## Hyprland
```bash
sudo dnf copr enable solopasha/hyprland -y
sudo dnf copr enable eddsalkield/swaylock-effects -y
sudo dnf copr enable erikreider/SwayNotificationCenter -y

sudo dnf install hyprland -y
sudo dnf install hyprpaper -y
sudo dnf install waybar -y
sudo dnf install swappy -y
sudo dnf install swaylock-effects -y
sudo dnf install mako -y
sudo dnf install rofi -y
sudo dnf install SwayNotificationCenter -y
```

## Terminal
```bash
sudo dnf install zsh -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

sudo dnf install kitty -y
sudo dnf install bat -y
sudo dnf install neofetch -y
sudo dnf install vim-enhanced -y

cp .zshrc $HOME/
```

## Music Player
```bash
sudo dnf install playerctl -y
flatpak install cider -y
```

## Fonts
```bash
sudo dnf install google-noto-emoji-fonts -y
sudo dnf install jetbrains-mono-fonts -y
sudo dnf install fontawesome-fonts-all -y
```

## Waybar dependencies
```bash
sudo dnf install brightnessctl -y
sudo dnf install pamixer -y
sudo dnf install bluez bluez-tools -y
```

# Post-install
## Nvidia drivers
```bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

sudo dnf install akmod-nvidia -y
```

### With cuda support
```bash
sudo dnf install xorg-x11-drv-nvidia-cuda -y
```

### Install nvidia hyprland & additionally packages
```bash
sudo dnf install hyprland-nvidia --allowerasing -y
sudo dnf install qt5-qtwayland qt5ct libva libva-nvidia-driver -y
```

### Fixing suspend/wakeup issues
```bash
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service

sudo grubby --update-kernel=ALL --args=NVreg_PreserveVideoMemoryAllocations=1
sudo grubby --update-kernel=ALL --args=NVreg_TemporaryFilePath=/var/tmp
```

Uncomment the NVidia envs on top of the file `~/.config/hypr/hyprland.conf`. Then reboot. Enjoy!

## Wallpaper
```bash
cd $HOME/.config/wallpaper
cp schedule-update-wallpaper.* ~/.config/systemd/user/

systemctl --user enable schedule-update-wallpaper.timer --now
```