# Zsh History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Install oh-my-zsh if not already installed
if [ ! -d "$ZSH" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install required plugins if not already installed
if [ ! -d "${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d "${ZSH_CUSTOM:-$ZSH/custom}/plugins/you-should-use" ]; then
  echo "Installing you-should-use..."
  git clone https://github.com/MichaelAquilina/zsh-you-should-use ${ZSH_CUSTOM:-$ZSH/custom}/plugins/you-should-use
fi

# Install starship if not already installed
if ! command -v starship &> /dev/null; then
  echo "Installing starship prompt..."
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

# Install zoxide if not already installed
if ! command -v zoxide &> /dev/null; then
  echo "Installing zoxide..."
  curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
fi

# Add Oh My Zsh plugins
plugins=(
  git
  ssh-agent
  web-search
  zoxide
  starship
  zsh-autosuggestions
  copypath
  copyfile
  fzf
  you-should-use
  aliases
  colored-man-pages
  tmux
  zsh-syntax-highlighting
)

# Configure tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=false
ZSH_TMUX_DEFAULT_SESSION_NAME="dev-container"

# Configure ssh-agent
zstyle ':omz:plugins:ssh-agent' agent-forwarding 'yes'

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Custom aliases
alias c='clear'
alias cat='bat -p'
alias can='bat'
alias lg='lazygit'
alias n='clear ; neofetch'
alias py='python3'
alias size="du -sh"
alias td='tmux detach'
alias tn='tmux new-session -s '
alias ta='tmux attach -t '
alias tl='tmux list-sessions'
alias tk='tmux kill-session -t '
alias r='ranger'
alias v='nvim'
alias sh='history | fzf'
alias szsh='source ~/.zshrc'
alias venv='python -m venv'
alias activate='source ./venv/bin/activate'

# Initialize tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Clear screen and run neofetch at the end
clear
neofetch
