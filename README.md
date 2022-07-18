# dotfiles

This my dotfiles to setup my own development environment automatically

Supported OS: Mac OS, WSL (Except of Windows)

## Common

### Oh My Zsh

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```shell
git clone git@github.com:hojongs/dotfiles.git $HOME/dotfiles
$HOME/dotfiles/init-essential.sh
$HOME/dotfiles/init-symlink.sh
```

## POSIX

### '₩' to '`'

cp -r Library/KeyBindings/ $HOME/

### iTerm

iTerm -> Preference: Load preferences from a custom folder or URL
`$HOME/dotfiles/iterm`

## Intellij

### Plugins

- Nyan Progress Bar
- IdeaVim
- Key Promoter X
- GitToolBox
- .ignore

