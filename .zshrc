
source /opt/homebrew/Library/Taps/now/homebrew-devtools/etc/zshrc
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function title {
    echo -ne "\033]0;"$*"\007"
}

alias dev='git checkout dev'
alias master='git checkout master'
alias launch='gll start'
alias gp='git pull'
alias gs='git status'
alias gl='git log --oneline'
alias gd='git diff'
alias prune='git fetch origin --prune && git branch -vv | grep "gone]" | awk "{print \$1}" | xargs git branch -D'
alias cls='clear'
alias java11="export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home"
alias java17="export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"
alias build='mvn clean install -U'
alias zshrc='cat ~/.zshrc | less'
alias shortcut='cat ~/.zshrc | less'
alias zsh='code ~/.zshrc'

gcb () {
        git checkout -b scratch/$1
}

gc () {
        git checkout scratch/$1
}

commit () {
        #git add .
        CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

        separator=""
        if [[ $CURRENT_BRANCH == scratch/* ]]
        then
        WORKITEM=${CURRENT_BRANCH#scratch/}
        WORKITEM=${WORKITEM%%[_-]*}
        fi

        if [[ -z "$1" ]]
        then
                echo "Please provide a commit message"
                return
        fi
        if [[ -z "$WORKITEM" ]]
        then
                git commit -m "$1"
        else
                git commit -m "$WORKITEM: $1"
        fi
}

push () {
        read "areYouSure?Press Enter button to continue pusing your commits to the remote ::"
        if [[ -z "$areYouSure" ]];
        then
                git push
        else
                echo "You have cancelled the push operation"
        fi
}

reset () {
        read "areYouSure?Press Enter button to continue to HARD REST ::"
        if [[ -z "$areYouSure" ]];
        then
                git reset --hard
        else
            echo "You have cancelled the HARD RESET operation"
        fi      
}

clean () {
        read "areYouSure?Press Enter button to FORCE CLEAN and delete all the untracked files ::"
        if [[ -z "$areYouSure" ]];
        then
                git clean -f
        else
            echo "You have cancelled the FORCED CLEAN operation"
        fi        
}

alias zboot='~/Documents/repos/myRepos/SnLocalZboot/zboot.sh'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# Load version control information
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
# zstyle ':vcs_info:git:*' formats 'branch[%b]'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{magenta}%n%f %F{blue}[${PWD/#$HOME/~}]%f%F{red}${vcs_info_msg_0_}%f > '

NL='
>'
PS1=${PS1}${NL}
