# Dotfiles

This setup is intended for Ubuntu (and secondly MacOS). Special thanks to whoever I stole it from :kissing_heart:

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

Install extensions in shell (or inside VSCode <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>P</kbd>)

```
code --install-extension HookyQR.beautify
code --install-extension HvyIndustries.crane
code --install-extension PeterJausovec.vscode-docker
code --install-extension abusaidm.html-snippets
code --install-extension akamud.vscode-theme-onedark
code --install-extension alefragnani.project-manager
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension felixfbecker.php-intellisense
code --install-extension ikappas.phpcs
code --install-extension linyang95.phpmd
code --install-extension robertohuertasm.vscode-icons
code --install-extension whatwedo.twig
code --install-extension xabikos.JavaScriptSnippets
```

```sh
ln -sf $HOME/dotfiles/vscode/keybindings.json $HOME/.config/Code/User/keybindings.json
ln -sf $HOME/dotfiles/vscode/settings.json $HOME/.config/Code/User/settings.json

# Mac OS
ln -sf $HOME/dotfiles/vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -sf $HOME/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
```

## VIM

```sh
ln -sf dotfiles/vimrc .vimrc
```

## Required tools

* [Zsh](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH) + [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh)
* [Hub](https://github.com/github/hub)

* [Visual Studio Code (debian)](https://code.visualstudio.com/Docs/?dv=linux64_deb)
* [Atom (debian)](https://atom.io/download/deb)
