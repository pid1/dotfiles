#! /usr/bin/env bash

# Don't be noisy on login
touch .hushlogin

# Install what we need
apt update
apt install build-essential \
            httpie \
            manpages-posix-dev \
            mosh \
            neovim \
            ripgrep \
            tmux \
            unzip \
            valgrind

# Set up host keys without user intervention
ssh-keygen -q -t rsa -N '' <<< ""$'\n'"y" 2>&1 >/dev/null

# SSH key management
echo 'SHELL=/bin/sh \
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin \
*/1 * * * *   root curl https://github.com/pid1.keys > /home/root/.ssh/authorized_keys' > /etc/cron.d/keys

# Configs
curl https://raw.githubusercontent.com/pid1/dotfiles/master/tmux.conf > /root/.tmux.conf
curl https://raw.githubusercontent.com/pid1/dotfiles/master/bash_aliases > /root/.bash_aliases

curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p /root/.config/nvim
curl https://raw.githubusercontent.com/pid1/dotfiles/master/init.vim > /root/.config/nvim/init.vim
