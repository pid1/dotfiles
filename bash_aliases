# only start a new session if we don't already have one
alias mux='tmux new-session -AD -s main'

# wrist savers
alias cp='cp -i'
alias mv='mv -i'
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

# just use neovim, and use it via Docker
alias vi="nvim"
alias vim="nvim"

# Daily tasks, based on OS
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias goodmorning="docker_nocache_rebuild"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias goodmorning="brew update && brew upgrade && docker_nocache_rebuild"
fi

# Docker shortcuts

alias build="docker build --rm -t \"${PWD##*/}\" -f Dockerfile ."
alias cbuild="docker build --rm --pull --no-cache -t \"${PWD##*/}\" -f Dockerfile ."
alias brun="docker build -q --rm -t \"${PWD##*/}\" -f Dockerfile .; docker run --rm \"${PWD##*/}\""

# Docker functions and aliases
docker_nocache_rebuild()
{
	cd "$HOME"/repos/personal/dockerfiles || exit
	bash rebuilds.sh
}

alias nvim="docker_neovim"
docker_neovim(){
if [[ "$1" = /* ]]; then
	file_name="$(basename ${1})"
	dir_name="$(dirname ${1})"
else
	file_name="$1"
	dir_name="$(pwd)"
fi
docker run -it --rm -v "$dir_name":/src neovim /bin/sh -c "cd /src;nvim $file_name"
}

alias hammer="docker_hammer"
docker_hammer(){
	docker run -v "$HOME"/.config/hammer:/etc/hammer --rm -it hammer "$@"
}

alias os="docker_openstack_cli"
docker_openstack_cli(){
	docker run --env-file "$HOME"/.config/os_env --rm -it openstack_cli "$@"
}

# For using glance etc
alias oscli="docker_openstack_shell"
docker_openstack_shell(){
	docker run --env-file "$HOME"/.config/os_env -v "$(pwd)":/home/appuser/ --rm -it --entrypoint /bin/bash openstack_cli
}

alias ansible="docker_ansible"
docker_ansible(){
    docker run --rm -it \
        -v "$HOME"/.ssh/id_rsa:/home/appuser/.ssh/id_rsa \
        -v "$HOME"/.ssh/id_rsa.pub:/home/appuser/.ssh/id_rsa.pub \
        -v "$(pwd)":/home/appuser ansible "$@"
}

alias ap="docker_ansible-playbook"
docker_ansible-playbook(){
    docker run --rm -it \
        -v "$HOME"/.ssh/id_rsa:/home/appuser/.ssh/id_rsa \
        -v "$HOME"/.ssh/id_rsa.pub:/home/appuser/.ssh/id_rsa.pub \
        -v "$(pwd)":/home/appuser ansible-playbook "$@"
}

alias nmap="docker_nmap"
docker_nmap(){
	docker run --rm -it nmap "$@"
}

alias pg="docker_playground"
docker_playground(){
	docker run --rm -it playground "$@"
}

alias ipmitool="docker_ipmitool"
docker_ipmitool(){
	docker run --rm -it ipmitool "$@"
}

alias kali="docker_kali"
docker_kali(){
	docker run --rm -it kali
}

alias http="docker_httpie"
docker_httpie(){
	docker run --rm -it httpie "$@"
}
