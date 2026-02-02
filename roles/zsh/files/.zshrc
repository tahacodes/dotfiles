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
    message="KUBECONFIG is now set to $KUBECONFIG_FILE"
    alias k-$KUBECONFIG_FILE="export KUBECONFIG='$KUBECONFIG_HOME/$KUBECONFIG_FILE'; echo $message"
  fi
done

alias k-clear="export KUBECONFIG=''"
alias k="kubectl --insecure-skip-tls-verify"
alias pip="pip3"
alias python="python3"

##### Adding stuff to PATH
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:$HOME/.go/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Add ~/.bin and any directory inside of it to PATH
export PATH="$PATH:$HOME/.bin"
for item in "$HOME/.bin"/*; do
  if [ -d "$item" ]; then
    PATH="$PATH:$item"
  fi
done

##### General configs
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)
ulimit -n 65536

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE="1"
# export PATH="/opt/homebrew/bin:$PATH"
# export PATH="/opt/homebrew/sbin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# SSH configs
export SSH_SK_PROVIDER=/usr/local/lib/sk-libfido2.dylib
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Go configs
export GOPATH="$HOME/.go"

# Docker Desktop configs
fpath=(/Users/taha/.docker/completions $fpath)
autoload -Uz compinit
compinit

##### oh-my-zsh configs
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="%F{red} Waiting...%f"

plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh
