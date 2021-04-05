# Dotfiles
## Install Ultimate Vim
https://github.com/amix/vimrc#install-for-your-own-user-only
```bash
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```
## Install Vundle.vim
https://github.com/VundleVim/Vundle.vim#quick-start
### youcompleteme as Vundle Plugin
https://vimawesome.com/plugin/youcompleteme
- You need to install manually. it requires cmake, g++, python-dev. otherwise you'll see the message "The ycmd server SHUT DOWN (restart with :YcmRestartServer)"
```bash
cd ~/.vim/bundle/YouCompleteMe
python3 install.py
```

## Init dotfiles
```bash
./init.sh
```
## Add oh-my-zsh plugins
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
### fzf - Ubuntu
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
C-R

### Mac or Linux
crontab $DOTFILES/cronjobs.txt

