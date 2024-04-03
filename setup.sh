# zsh
if cp zsh/.zshrc $HOME/.zshrc; then
  echo "Copied zsh config"
fi

# tmux
if cp tmux/.tmux.conf $HOME/.tmux.conf; then
  echo "Copied tmux config"
fi

# nvim
if cp -r nvim/* $HOME/.config/nvim/.; then
  echo "Copied nvim config"
fi

# kitty
if cp kitty/kitty.conf $HOME/.config/kitty/kitty.conf; then
  echo "Copied kitty config"
fi
