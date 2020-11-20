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
sudo apt-get install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
```
```
plugins=(
	fzf
)
```
 
## zsh-autosuggestions
https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
```
plugins=(
	zsh-autosuggestions
)
```


## zsh-syntax-highlighting
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
plugins=(
	zsh-syntax-highlighting
)

# git
```sh
git config --global user.email "hojong.jjh@gmail.com"
git config --global user.name "Jongho Jeon"
```

# python3-pip
```sh
sudo apt-get install python3-pip
```

# vim
## ultimate vim
https://github.com/amix/vimrc#how-to-install-the-awesome-version
```sh
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Vundle.vim
https://github.com/VundleVim/Vundle.vim#quick-start
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## YouCompleteMe
https://github.com/ycm-core/YouCompleteMe
```sh
sudo apt-get install build-essential cmake vim python3-dev

cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all
```

# Gradle
https://gradle.org/releases/
```sh
echo export PATH=~/gradle-6.7/bin:\$PATH >> ~/.zshrc
```

# Intellij
ideaVim
nyan progress bar
GitToolBox

