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
alias pip="pip3"
alias python="python3"

##### Adding stuff to PATH
export PATH="$PATH:/usr/local/sbin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.go/bin:$PATH"

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/helm@3/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# mimocode
export PATH=/Users/taha/.mimocode/bin:$PATH

# opencode
export PATH=/Users/taha/.opencode/bin:$PATH

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
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# SSH configs
export SSH_SK_PROVIDER=/usr/local/lib/sk-libfido2.dylib
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# Go configs
export GOPATH="$HOME/.go"

# Docker Desktop completions (compinit runs inside oh-my-zsh)
fpath=(/Users/taha/.docker/completions $fpath)

##### oh-my-zsh configs
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="%F{red} Waiting...%f"

plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh

# History: keep everything, never trim or dedupe
HISTSIZE=1000000
SAVEHIST=1000000
unsetopt hist_expire_dups_first hist_ignore_dups hist_ignore_space

# Plugins from brew (syntax-highlighting must stay last)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
