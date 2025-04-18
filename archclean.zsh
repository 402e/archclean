#!/bin/zsh

autoload -Uz colors && colors
setopt prompt_subst

echo "${fg[blue]}Removing pacman orphan packages...${reset_color}"
orphans=("${(@f)$(pacman -Qdtq)}")
if [[ -n $orphans ]]; then
    sudo pacman -Rns "${orphans[@]}"
else
    echo "${fg[green]}No pacman orphans found.${reset_color}"
fi

echo ""
echo "${fg[blue]}Cleaning pacman cache (keeping 1 latest version)...${reset_color}"
sudo paccache -r -k1

echo ""
echo "${fg[yellow]}Manually installed packages:${reset_color}"
pacman -Qent | less

echo ""
read -q "aur_clean?Clean AUR orphans (yay)? [y/N]: "
echo ""
if [[ $aur_clean == [yY] ]]; then
    echo "${fg[blue]}Removing yay orphan packages...${reset_color}"
    yay_orphans=("${(@f)$(yay -Yq --orphans)}")
    if [[ -n $yay_orphans ]]; then
        yay -Rns "${yay_orphans[@]}"
    else
        echo "${fg[green]}No yay orphans found.${reset_color}"
    fi
else
    echo "${fg[cyan]}Skipping AUR cleanup.${reset_color}"
fi

echo ""
echo "${fg[green]}Done. System cleanup completed.${reset_color}"
