DOTFILES_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


# Composer
if command -v composer &> /dev/null; then
	source "$DOTFILES_PATH/composer_completion/composer-autocomplete"
	export PATH="$PATH:"$(composer global config bin-dir --absolute 2> /dev/null)
fi

# Kubernetes
source "$DOTFILES_PATH/kubectl_completion"
alias k=kubectl
complete -F __start_kubectl k
