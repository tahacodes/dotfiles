# zsh
if cp zsh/.zshrc $HOME/.zshrc; then
    echo "Copied zsh configs"
fi

# tmux
if cp tmux/.tmux.conf $HOME/.tmux.conf; then
    echo "Copied tmux configs"
fi

# nvim
if cp -r nvim/* $HOME/.config/nvim/.; then
    echo "Copied nvim configs"
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
