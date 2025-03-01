FROM archlinux:latest

# Update and install applications
RUN pacman -Syu -- noconfirm && \
    pacman -S --noconfirm --needed \
    zsh \
    git \
    lazygit \
    neovim \
    ranger \
    tmux \
    python \
    python-pip \
    python-virtualenv \
    nodejs \
    npm \
    ripgrep \
    fd \
    fzf \
    htop \
    tldr \
    neofetch \
    bat \
    curl \
    wget \
    unzip \
    exa \
    starship \
    zoxide

RUN useradd -m -s /bin/zsh developer && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer

USER developer
WORKDIR /home/developer

RUN tldr --update

RUN mkdir -p /home/developer/.config && \
    mkdir -p /home/developer/.venvs && \
    mkdir -p /home/developer/.local/bin

COPY --chown=developer:developer container-dotfiles/.zshrc /home/developer/
COPY --chown=developer:developer container-dotfiles/.tmux.conf /home/developer/ || true
COPY --chown=developer:developer container-dotfiles/.config /home/developer/.config/ || true

VOLUME ["/home/developer/projects"]
WORKDIR /home/developer/projects

CMD ["/bin/zsh"]
