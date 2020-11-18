# Network
sudo lshw -class network

# Grub
sudo /etc/default/grub
sudo update-grub

# Packages
sudo apt-get install -y curl wget tree git vim-gtk tmux zsh
sudo apt-get install -y build-essential linux-headers-$(uname -r)

# ohmyzsh
https://github.com/ohmyzsh/ohmyzsh#basic-installation

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## git (default)
command aliases for git
https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git#aliases

## fzf
<C-t>
https://github.com/junegunn/fzf#using-git
```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
```
add fzf to ohmyzsh plugin block
 
## zsh-autosuggestions
https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh

## zsh-syntax-highlighting
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
plugins=( [plugins...] zsh-syntax-highlighting)

# git
```sh
git config --global user.email "hojong.jjh@gmail.com"
git config --global user.name Jongho Jeon
```

# python3-pip
```sh
sudo apt-get install python3-pip
```

# ultimate vim
https://github.com/amix/vimrc#how-to-install-the-awesome-version

# Vundle.vim
https://github.com/VundleVim/Vundle.vim#quick-start
