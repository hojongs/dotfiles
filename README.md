# dotfiles

This my dotfiles to setup my own development environment automatically

Supported OS: Mac OS, WSL

## How to use

```shell
git clone git@github.com:hojongs/dotfiles.git $HOME/dotfiles
source $HOME/dotfiles/install.sh # just once
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.config/gh/config.yml $HOME/.config/gh/config.yml 
```

## Github Action Utils

https://github.com/nektos/act

```
brew install act
```

## gRPC Utils

### ghz

https://github.com/bojand/ghz

```
brew install ghz
```

### gRPC UI

https://github.com/fullstorydev/grpcui

```
go install github.com/fullstorydev/grpcui/cmd/grpcui@latest
```

### protoc

https://grpc.io/docs/protoc-installation/

```
brew install protobuf
```

### buf

https://github.com/bufbuild/buf

```
brew tap bufbuild/buf
brew install buf
```

## AWS

### S3 CMD

https://github.com/s3tools/s3cmd

```
brew install s3cmd
```

## Java/Kotlin

### Gradle

https://github.com/gradle/gradle

```
brew install gradle
```

# Other Utils

```
brew install tmux cask
```

