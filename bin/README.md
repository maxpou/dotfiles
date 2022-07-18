# How to generate scripts?

## Generate install_plugin.sh

```sh
code --list-extensions | awk '$0="code --install-extension "$0' > vscode/install_plugin.sh
```

## Generate install-npm-globals.sh

```sh
# Don't forget to remove the first line
npm list -g --depth 0 --parseable=true | cut -c 29- | awk '$0="npm i -g "$0' > bin/install-npm-globals.sh
```
