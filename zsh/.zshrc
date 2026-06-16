# Path to your Oh My Zsh installation.
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/nvim:$PATH"
export PATH="$PATH:/mnt/c/Users/madram/AppData/Local/Programs/Microsoft VS Code/bin"
export PATH="$PATH:/snap/bin"
export ZSH="$HOME/.oh-my-zsh"
DOWNLOADS='/mnt/c/Users/madram/Downloads'
DOCUMENTS='/mnt/c/Users/madram/Documents'


ZSH_THEME="robbyrussell"


plugins=(git  zsh-autosuggestions  zsh-syntax-highlighting sudo docker)

source $ZSH/oh-my-zsh.sh
unsetopt nomatch
setopt rmstarsilent

alias vi="nvim"
alias softwareupdate="sudo apt update && sudo apt upgrade -y --allow-downgrades && sudo apt autoremove -y; sudo snap refresh;if [ -e /var/run/reboot-required ];then sudo reboot;fi"
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ff='firefox >/dev/null 2>&1 &'
#alias grafana='grep -q "10.1.60.12 grafanadc1.hps.int" /etc/hosts || echo "10.1.60.12 grafanadc1.hps.int" | sudo tee -a /etc/hosts >/dev/null; snap run firefox >/dev/null 2>&1 &'
#alias managedengine='grep -q "10.1.2.26 manageengine.hps.int" /etc/hosts || echo "10.1.2.26 manageengine.hps.int" | sudo tee -a /etc/hosts >/dev/null; snap run firefox >/dev/null 2>&1 &'
# Auto-start tmux (always new session, no nesting issues)
if command -v tmux &>/dev/null && [ -z "$TMUX" ]; then
  exec tmux new-session -s "sess_$(date +%s)"
fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
PROMPT_EOL_MARK=""
#FOR WSL
#export http_proxy="http://127.0.0.1:3128"
#export https_proxy="http://127.0.0.1:3128"
#export no_proxy="localhost,127.0.0.1,.docker.internal"
