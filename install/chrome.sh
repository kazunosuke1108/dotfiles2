google-chrome --version&> /dev/null
if [ $? -ne 0 ]; then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    echo "Google Chrome installed"
else    
    echo "Google Chrome already installed"
fi
