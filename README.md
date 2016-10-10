# Dotfiles

This setup is intended for Ubuntu. Special thanks to whoever I stole it from :kissing_heart:

## Aliases

```sh
ln -sf dotfiles/.aliases .aliases
```

## Git (&hub)

```sh
ln -sf dotfiles/gitconfig .gitconfig
```

## ATOM

1. Install packages: `apm stars --user maxpou --install`
2. Run

    ```sh
    ln -sf $HOME/dotfiles/vscode/keymap.cson $HOME/.atom/keymap.cson
    ln -sf $HOME/dotfiles/vscode/config.cson $HOME/.atom/config.cson
    ```

Also see [my gist](https://gist.github.com/maxpou/5828f70ba994ee3b365d)  

## VS Code

Extensions (Inside VSCode <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>)
```
ext install npm-intellisense
ext install path-intellisense
ext install vscode-eslint
```

```sh
ln -sf $HOME/dotfiles/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -sf $HOME/dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json
```

## Required tools

* [Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) + [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Hub](https://github.com/github/hub)

* [Visual Studio Code (debian)](https://code.visualstudio.com/Docs/?dv=linux64_deb)
* [Atom (debian)](https://atom.io/download/deb)
