## dotfiles

### Features

* Auto export Homebrew* environment variables
* Fast Git prompt
* Autocompletion for Composer*
* Autocompletion for Kubernetes*
* Current Kubernetes context in prompt

*\* if it's installed*


### Aliases
* `~` shorthand alias for `cd ~`
* `..` shorthand alias for `cd ..`
* `igrep` shorthand alias for `grep -i`
* `k` shorthand alias for `kubectl`
* `ll` list all files in long format with numerical permissions
* `path` print each PATH entry on a separate line
* `ping` now "accept" URLs


### Requirements macOS
* [Homebrew](https://brew.sh/#install)
* [bash >= 4.2](https://formulae.brew.sh/formula/bash#default)
* [bash-completion@2](https://formulae.brew.sh/formula/bash-completion@2#default)


### Install
```bash
git clone git@github.com:sergioccrr/dotfiles.git ~/.dotfiles

# Linux
echo -e '\nsource ~/.dotfiles/bashrc' >> ~/.bashrc

# macOS
echo -e '\nsource ~/.dotfiles/bashrc' >> ~/.bash_profile
```
