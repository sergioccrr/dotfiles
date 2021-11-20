DOTFILES_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Exports
source "$DOTFILES_PATH/bash_exports"


# bash_completion fallback for macOS
# See: https://itnext.io/programmable-completion-for-bash-on-macos-f81a0103080b
if ! command -v _get_comp_words_by_ref &> /dev/null && [[ -r /usr/local/etc/profile.d/bash_completion.sh ]]; then
	source /usr/local/etc/profile.d/bash_completion.sh
fi


# Composer
if command -v composer &> /dev/null; then
	source "$DOTFILES_PATH/composer_completion/composer-autocomplete"
	export PATH="$PATH:"$(composer global config bin-dir --absolute 2> /dev/null)
fi


# Kubernetes
if command -v kubectl &> /dev/null; then
	source "$DOTFILES_PATH/kubectl_completion"
	alias k='kubectl'
	complete -F __start_kubectl k
fi


# Aliases
source "$DOTFILES_PATH/bash_aliases"


# Git
if command -v git &> /dev/null; then
	source "$DOTFILES_PATH/git_aliases"
	source "$DOTFILES_PATH/gitstatus/gitstatus.plugin.sh"
	source "$DOTFILES_PATH/git_prompt"
fi


# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\] '           # green user@host
PS1+='\[\033[01;34m\]\w\[\033[00m\]'              # blue current working directory
PS1+='${GITSTATUS_PROMPT:+ [$GITSTATUS_PROMPT]}'  # git status (requires promptvars option)
PS1+='\n\[\033[01;$((31+!$?))m\]\$\[\033[00m\] '  # green/red (success/error) $/# (normal/root)
PS1+='\[\e]0;\u@\h: \w\a\]'                       # terminal title: user@host: dir


# Extra
if [[ -r "$DOTFILES_PATH/bash_extra" ]]; then
	source "$DOTFILES_PATH/bash_extra"
fi
