# git config
git config --global commit.template ~/dotfiles/.commit_template

# aliases
source ~/dotfiles/.aliases
echo "source ~/dotfiles/.aliases" >> ~/.bashrc

# install tools
source ~/dotfiles/install/mxergo_shortcut.sh
source ~/dotfiles/install/terminator.sh
source ~/dotfiles/install/chrome.sh
source ~/dotfiles/install/vscode.sh
source ~/dotfiles/install/docker.sh

# GPUがあるかどうかを確認
if lspci | grep -i nvidia > /dev/null 2>&1; then
    echo "NVIDIA GPU detected, installing nvidia-docker."
    source ~/dotfiles/install/nvidia_docker.sh
else
    echo "No NVIDIA GPU detected, skipping nvidia-docker installation."
fi

source ~/dotfiles/install/boot_repair.sh
source ~/dotfiles/install/task.sh
source ~/dotfiles/install/uv.sh

# Ubuntuのバージョンを取得
ubuntu_version=$(lsb_release -r | awk '{print $2}')

# バージョンの主部分を取得 (20.04 -> 20)
ubuntu_major_version=$(echo $ubuntu_version | cut -d. -f1)

# バージョンの副部分を取得 (20.04 -> 04)
ubuntu_minor_version=$(echo $ubuntu_version | cut -d. -f2)

# 比較用にバージョンを数値に変換 (20.04 -> 2004)
ubuntu_version_num=$((10#$ubuntu_major_version * 100 + 10#$ubuntu_minor_version))

# 条件分岐 - Ubuntu 20.04以下の場合にコマンドを実行
if [ $ubuntu_version_num -le 2004 ]; then
    echo "Ubuntu $ubuntu_version detected, executing the ros1 install."
    # 実行したいコマンドをここに記述
    source ~/dotfiles/install/ros1.sh
fi
