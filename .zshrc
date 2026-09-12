
source /opt/homebrew/Library/Taps/now/homebrew-devtools/etc/zshrc
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function title {
    echo -ne "\033]0;"$*"\007"
}

alias repos='cd ~/Documents/repos/ && tree -L 1'
alias dev='git checkout dev'
alias master='git checkout master'
alias main='git checkout main'
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
alias cherry='~/Documents/cherry_pick.sh'
alias python='python3'
alias pip='pip3'

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

tree() {
    # If the first argument is a plain number (e.g., 1, 3, 4)
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        # Extract the number, shift the arguments, and run tree with -L <number>
        local level=$1
        shift
        command tree -L "$level" -C --dirsfirst "$@"
    # If no level flag (-L) is manually provided, default to 2
    elif [[ "$*" != *"-L"* ]]; then
        command tree -L 2 -C --dirsfirst "$@"
    else
        command tree -C --dirsfirst "$@"
    fi
}

alias zboot='~/Documents/repos/myRepos/SnLocalSetup/zboot.sh'

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# Load version control information
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
# zstyle ':vcs_info:git:*' formats 'branch[%b]'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='
%F{201}%n%f %F{green}[${PWD/#$HOME/~}]%f%F{202}${vcs_info_msg_0_}%f
%F{201}>>❯❯%f '

# SnLocalSetup aliases
alias zboot='/Users/rohit.roy/Documents/repos/myRepos/SnLocalSetup/zboot.sh'
alias setup='/Users/rohit.roy/Documents/repos/myRepos/SnLocalSetup/setup.sh'
alias zdump='/Users/rohit.roy/Documents/repos/myRepos/SnLocalSetup/zdump.sh'


# Added by Windsurf
export PATH="$PATH:/Applications/Windsurf.app/Contents/Resources/app/bin"
alias python=python3

# Created by `pipx` on 2025-10-31 12:18:22
export PATH="$PATH:/Users/rohit.roy/.local/bin"

# Windsurf surf command - add ~/bin to PATH
export PATH="$HOME/bin:$PATH"


export PATH="$PATH:/Applications/ServiceNow CLI/bin"

# Added by Devin
export PATH="/Users/rohit.roy/.local/bin:$PATH"

# Added by Devin
export PATH="/Users/rohit.roy/.codeium/windsurf/bin:$PATH"

# Added by Antigravity IDE
export PATH="/Users/rohit.roy/.antigravity-ide/antigravity-ide/bin:$PATH"

alias antigravity="antigravity-ide"

