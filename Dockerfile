FROM archlinux:latest

# Update and install applications
RUN pacman -Sy --noconfirm archlinux-keyring && \
    pacman -Syu --noconfirm && \
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

# Create developer user
RUN useradd -m -s /bin/zsh developer && \
    mkdir -p /etc/sudoers.d && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer

USER developer
WORKDIR /home/developer

# Update TLDR
RUN tldr --update

# Install Tmux Plugin Manager (TPM)
RUN git clone https://github.com/tmux-plugins/tpm /home/developer/.tmux/plugins/tpm

# Create required directories
RUN mkdir -p /home/developer/.config /home/developer/.venvs /home/developer/.local/bin

# Copy dotfiles if available
COPY --chown=developer:developer container-dotfiles/.zshrc /home/developer/
COPY --chown=developer:developer container-dotfiles/.tmux.conf* /home/developer/
COPY --chown=developer:developer container-dotfiles/.config/ /home/developer/.config.

# Ensure correct file permissions
RUN chown -R developer:developer /home/developer

# Add local bin to path
ENV PATH="/home/developer/.local/bin:$PATH"

# Set up volume and working directory
VOLUME ["/home/developer/projects"]
WORKDIR /home/developer/projects

CMD ["/bin/zsh"]
