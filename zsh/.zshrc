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

alias k-clear="export KUBECONFIG=''"
alias k="kubectl --insecure-skip-tls-verify"
alias pip="pip3"
alias python="python3"

##### Adding stuff to PATH
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/go/bin"

# Add ~/.bin and any directory inside of it to PATH
export PATH="$PATH:$HOME/.bin"
for item in "$HOME/.bin"/*; do
  if [ -d "$item" ]; then
    PATH="$PATH:$item"
  fi
done

##### General configs
export GPG_TTY=$(tty)
export LANG=en_US.UTF-8

##### oh-my-zsh configs
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="%F{red} Waiting...%f"

plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh
