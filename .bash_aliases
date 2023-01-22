function nvim () {
    command nvim $@
    echo -ne '\x1b\x5b0\x20\x71'
}

function smbmount () {
    command mkdir -p /home/ulrich/shares/$1
    command sudo mount -t cifs -o username=ulrich.barnstedt //htldaten/$1 /home/ulrich/shares/$1
}

function ff () { 
    command find . -maxdepth ${2:-3} -name "*${1}*"
}

function fcd () {
    dirName=$(find . -maxdepth ${2:-3} -type d -name "*${1}*" | head -1) 
   
    if [ -z "$dirName"  ] && [ -z "${2}" ]
    then 
        echo "Incrementing search depth ..."
        dirName=$(find . -maxdepth ${2:-6} -type d -name "*${1}*" | head -1) 
    fi
    
    if [ -z "$dirName" ] 
    then 
        echo "Not found"
    else
        command cd $dirName
    fi
}

function mac_steal () {
    sudo ip link set wlp62s0 down
    sudo macchanger --mac ${1} wlp62s0
    sudo ip link set wlp62s0 up
}

alias reset="echo -ne '\x1b\x5b0\x20\x71'"
alias ll="exa -la --icons"
alias lsf="exa --group-directories-first -la"
alias lfs="exa --group-directories-first -la"
alias lsfs="exa --group-directories-first -la --no-user --no-permissions --no-time --no-filesize"
alias pls='sudo $(history -p !!)'
if [ "$TERM" = "xterm-256color" ]; then
    alias lg="ls -lah | lolcat -t"
else
    alias lg="ls -lah"
fi
alias tetris="bastet"
alias fartune="fortune | cowsay | lolcat -t"
alias ltree="exa -T -L 2"
alias lgtree="exa -T -L 2 | lolcat -t"
alias v="nvim"
alias alt="update-alternatives"
alias javac8a="find . -name *.java -print | xargs /usr/lib/jvm/java-8-openjdk-amd64/bin/javac"
alias update="sudo apt update && sudo apt upgrade -y && sudo snap refresh && rustup update && cargo install-update -a && brew update && brew upgrade && flatpak update "
alias dndg="(cd ~/Programming/Projects/JS/dnd-cli && node index.js c)"
alias cp="cp -i"
alias ite_kb="ite8291r3-ctl"
alias mpvt="mpv --no-config --vo=tct "
export BAT_THEME="OneHalfDark"
export BAT_PAGER=""


# Prompt related

# conf
FREQUENCY=0.5
NF_INSTALLED=true

TTY=$(tty | tr -d /dev/pts/)
JOBS='$([ \j -gt 0 ] && echo "[\j] ")';
if [ "$NF_INSTALLED" = true ]; then
    PS1=$'[\xee\xae\x99 \u \xee\x98\xa1 \xef\x84\x89 \h \xee\x98\xa1 \xee\xaf\x8a ${TTY}]'
else
    PS1=$'[\u | \h | \s/${TTY}]'
fi

if [ "$TERM" = "xterm-256color" ] || [ "$TERM" = "alacritty" ]; then
    PS1=$(echo ${PS1@P} | lolcat -f -t -F ${FREQUENCY} | sed -r 's/[\x1b]\[[0-9]+;[0-9]+;[0-9]+;[0-9]+;[0-9]+[a-z]|\x1b\[[0-9]+[a-z]/\\\[&\\\]/g')
    export PS1="${JOBS}\[\033[38;5;247m\]\A\[$(tput sgr0)\] ${PS1} \[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;14m\]*\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
else
    PS1=$(echo ${PS1@P})
    export PS1="${JOBS}\A ${PS1} \w *\$ "
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


eval "$(pyenv init -)"
export PATH="/home/ulrich/.cargo/bin:$PATH"
source /home/ulrich/Software/alacritty/extra/completions/alacritty.bash
# eval "$(oh-my-posh init bash)"
