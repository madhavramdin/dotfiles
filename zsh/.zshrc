# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"


plugins=(git  zsh-autosuggestions  zsh-syntax-highlighting sudo docker)

source $ZSH/oh-my-zsh.sh
unsetopt nomatch
setopt rmstarsilent

alias vi="nvim"
alias softwareupdate="sudo apt update && sudo apt upgrade -y && sudo apt autoremove; sudo snap refresh;if [ -e /var/run/reboot-required ];then sudo reboot;fi"
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  tmux attach || tmux new-session
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#FOR WSL
#export http_proxy="http://127.0.0.1:3128"
#export https_proxy="http://127.0.0.1:3128"
#export no_proxy="localhost,127.0.0.1,.docker.internal"

