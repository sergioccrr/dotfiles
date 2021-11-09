DOTFILES_PATH="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


# Kubernetes
source $DOTFILES_PATH/kubectl_completion
alias k=kubectl
complete -F __start_kubectl k
