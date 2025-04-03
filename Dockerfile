FROM alpine:latest
# Install curl, zsh and zsh-autosuggestions
RUN apk add --no-cache curl zsh zsh-autosuggestions
# Install atuin via script
RUN curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
# Use newest atuin init script (the part before the keybindings)
RUN curl --proto '=https' --tlsv1.2 -LsSf https://raw.githubusercontent.com/atuinsh/atuin/refs/heads/main/crates/atuin/src/shell/atuin.zsh > ~/atuin-init.zsh
# Add keybindings usually added by atuin init zsh
RUN /root/.atuin/bin/atuin init zsh | tail -n 11 >> ~/atuin-init.zsh
# Copy the minimal config over
COPY ./.zshrc /root/.zshrc
