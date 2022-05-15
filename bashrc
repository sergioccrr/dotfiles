DOTFILES_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Exports
source "$DOTFILES_PATH/bash_exports"


# Homebrew
if [[ -r /usr/local/bin/brew ]]; then
	eval "$(/usr/local/bin/brew shellenv)" # Intel CPU
elif [[ -r /opt/homebrew/bin/brew ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)" # Apple Silicon CPU
fi


# bash_completion fallback for macOS
# See: https://itnext.io/programmable-completion-for-bash-on-macos-f81a0103080b
if ! command -v _get_comp_words_by_ref &> /dev/null && [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
	source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
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

	function k8s_prompt_update() {
		K8S_PROMPT="$(kubectl config current-context 2>/dev/null)"
	}

	PROMPT_COMMAND="k8s_prompt_update;$PROMPT_COMMAND"
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
PROMPT_DIRTRIM=3	# Shorten current directory
shopt -s promptvars	# Enable promptvars so that ${XXX_PROMPT} in PS1 is expanded

PS1='\[\033[01;32m\]\u@\h\[\033[00m\] '           # green user@host
PS1+='\[\033[01;34m\]\w\[\033[00m\]'              # blue current working directory
PS1+='${GITSTATUS_PROMPT:+ [$GITSTATUS_PROMPT]}'  # git status (requires promptvars option)
PS1+='${K8S_PROMPT:+ ☸️  $K8S_PROMPT}'             # k8s status (requires promptvars option)
PS1+='\n\[\033[01;$((31+!$?))m\]\$\[\033[00m\] '  # green/red (success/error) $/# (normal/root)
PS1+='\[\e]0;\u@\h: \w\a\]'                       # terminal title: user@host: dir


# Extra
if [[ -r "$DOTFILES_PATH/bash_extra" ]]; then
	source "$DOTFILES_PATH/bash_extra"
fi
