# zsh
if cp zsh/.zshrc $HOME/.zshrc; then
    echo "Copied zsh configs"
fi

# tmux
if cp tmux/.tmux.conf $HOME/.tmux.conf; then
    echo "Copied tmux configs"
fi

# vim
if cp vim/.vimrc $HOME/.vimrc; then
    echo "Copied vim configs"
fi

# kitty
if cp kitty/kitty.conf $HOME/.config/kitty/kitty.conf; then
    echo "Copied kitty configs"
fi

# Git
if cp git/.gitconfig $HOME/.gitconfig; then
    echo "Copied git configs"
fi

# SSH
if cp ssh/config $HOME/.ssh/config; then
    echo "Copied ssh configs"
fi

# Zed
if cp -R zed/* $HOME/.config/zed; then
    echo "Copied zed configs"
fi
