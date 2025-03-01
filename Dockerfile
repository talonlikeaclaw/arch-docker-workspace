FROM debian:latest

# Update and install applications
RUN apt update && apt upgrade -y

RUN apt install -y \
    zsh \
    gpg \
    git \
    neovim \
    ranger \
    tmux \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    ripgrep \
    fd-find \
    fzf \
    htop \
    tldr \
    neofetch \
    bat \
    curl \
    wget \
    unzip \
    exa \
    tree \
    zoxide \
    sudo

RUN curl -Lo /usr/local/bin/lazygit https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_linux_$(dpkg --print-architecture) && \
    chmod +x /usr/local/bin/lazygit

RUN curl -sS https://starship.rs/install.sh | sh -s -- -y

# Create developer user
RUN useradd -m -s /bin/zsh -G sudo developer && \
    mkdir -p /etc/sudoers.d/ && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer

USER developer
WORKDIR /home/developer

# Install Tmux Plugin Manager (TPM)
RUN git clone https://github.com/tmux-plugins/tpm /home/developer/.tmux/plugins/tpm

# Create required directories
RUN mkdir -p /home/developer/.config /home/developer/.venvs /home/developer/.local/bin

# Copy dotfiles if available
COPY --chown=developer:developer container-dotfiles/.zshrc /home/developer/
COPY --chown=developer:developer container-dotfiles/.tmux.conf* /home/developer/
COPY --chown=developer:developer container-dotfiles/.config/ /home/developer/.config/

# Ensure correct file permissions
RUN chown -R developer:developer /home/developer

# Add local bin to path
ENV PATH="/home/developer/.local/bin:$PATH"

# Set up volume and working directory
VOLUME ["/home/developer/projects"]
WORKDIR /home/developer/projects

CMD ["/bin/zsh"]
