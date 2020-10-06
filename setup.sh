#! /usr/bin/env bash

touch .hushlogin
apt update
apt install build-essential \
            manpages-posix-dev \
            mosh \
            tmux \
            unzip \
            valgrind

ssh-keygen -q -t rsa -N '' <<< ""$'\n'"y" 2>&1 >/dev/null

echo 'SHELL=/bin/sh \
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin \
*/5 * * * *   root curl https://github.com/pid1.keys > /home/root/.ssh/authorized_keys' > /etc/cron.d/keys

curl https://raw.githubusercontent.com/pid1/dotfiles/master/tmux.conf > /root/.tmux.conf
curl https://raw.githubusercontent.com/pid1/dotfiles/master/bash_aliases > /root/.bash_aliases