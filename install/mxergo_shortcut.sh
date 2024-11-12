sudo apt update
sudo apt-get install -y xdotool xbindkeys

cp ~/dotfiles/.config/.xbindkeysrc ~/.xbindkeysrc
killall xbindkeys
xbindkeys
