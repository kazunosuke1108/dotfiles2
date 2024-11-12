# dotfiles
My personal dotfiles

```shell
cd ~
git clone https://github.com/Decwest/dotfiles.git
```

## Usage

### Install all
```shell
source install.sh
```

### git template
```shell
cd dotfiles
git config --global commit.template ~/dotfiles/.commit_template
```

### Register aliases
```shell
source ~/dotfiles/.aliases
echo "source ~/dotfiles/.aliases" >> ~/.bashrc
```