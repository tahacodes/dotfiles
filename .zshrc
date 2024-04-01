##### Custom aliases
KUBECONFIG_HOME="$HOME/.kube/config.d"

# Check if the KUBECONFIG_HOME directory exists, if not create it
if [ ! -d "$KUBECONFIG_HOME" ]; then
  mkdir -p "$KUBECONFIG_HOME"
fi

# Create alias for each kubeconfig found in the KUBECONFIG_HOME based in their name.
for KUBECONFIG_FILE in "$KUBECONFIG_HOME"/*; do
  if [ -f "$KUBECONFIG_FILE" ]; then
    KUBECONFIG_FILE=$(basename "$KUBECONFIG_FILE")
    alias k-$KUBECONFIG_FILE="export KUBECONFIG='$KUBECONFIG_HOME/$KUBECONFIG_FILE'"
  fi
done

alias k="kubectl --insecure-skip-tls-verify"
alias pip="pip3"
alias python="python3"

##### General configs
export GPG_TTY=$(tty)
export LANG=en_US.UTF-8

##### oh-my-zsh configs
export PATH=$HOME/.bin:/usr/local/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="%F{red}Waiting...%f"

plugins=(git golang kubectl)

source $ZSH/oh-my-zsh.sh
