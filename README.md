git clone https://github.com/madhavramdin/dotfiles.git ~/github/dotfiles && cd ~/github/dotfiles && for d in bash zsh git vim nvim tmux ssh; do stow -t ~ "$d"; done
