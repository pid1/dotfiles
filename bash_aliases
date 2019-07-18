# only start a new session if we don't already have one
alias mux='tmux new-session -AD -s main'

# wrist savers
alias dl='cd /home/j/net'
alias g='git'
alias cp='cp -i'
alias mv='mv -i'
alias ap='ansible-playbook -K'
alias svim="sudo nvim"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# detect which ls flavor is in use
if ls --color > /dev/null 2>&1; then # gnu
	colorflag="--color"
else # macOS
	colorflag="-G"
fi

# shellcheck disable=SC2139
alias ls="command ls ${colorflag}"

# Always enable colored grep output
alias grep='grep --color=auto'

# untar
alias untar='tar xzvf'

# thefuck
alias fuck='eval $(thefuck $(fc -ln -1))'
# thefuck, conference edition
alias please='fuck'

# just use neovim
alias vi="nvim"
alias vim="nvim"
