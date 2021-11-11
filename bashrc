DOTFILES_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


# bash_completion fallback for macOS
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

if [[ -r "$DOTFILES_PATH/bash_aliases_extra" ]]; then
	source "$DOTFILES_PATH/bash_aliases_extra"
fi


# Git prompt
source "$DOTFILES_PATH/gitstatus/gitstatus.prompt.sh"
