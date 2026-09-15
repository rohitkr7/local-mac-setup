
source /opt/homebrew/Library/Taps/now/homebrew-devtools/etc/zshrc
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Java and maven related commands
alias java11="export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-11.jdk/Contents/Home"
alias java17="export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home"
alias build='mvn clean install -U'
alias zshrc='less ~/.zshrc'
alias shortcut='less ~/.zshrc'
alias zsh='code ~/.zshrc'
alias cherry='~/Documents/cherry_pick.sh'
alias python='python3'
alias pip='pip3'

# The title function changes the title of your current terminal tab or window.
function title {
    echo -ne "\033]0;"$*"\007"
}

# Directly Jump to important directories
alias repos='cd ~/Documents/repos/ && tree -L 1'
alias github='cd ~/Documents/repos/myGithub/ && tree -L 1'
alias dpr='cd ~/Documents/repos/dpr/ && tree -L 1'

# --------------------------------------------------------------- #
# Git related commands
alias dev='git checkout dev'
alias master='git checkout master'
alias main='git checkout main'
alias launch='gll start'
alias gp='git pull'
alias gs='git status'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gd='git diff'
alias prune='git fetch origin --prune && git branch -vv | grep "gone]" | awk "{print \$1}" | xargs git branch -D'

# Git checkout -b <Args>
gcb () {
        git checkout -b "scratch/${1#scratch/}"
}

# Git checkout <Args>
gc () {
        git checkout "scratch/${1#scratch/}"
}

# Git commit -m <Message>
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

# Switch back to the previous git branch (like hitting "back" button)
alias gco-='git checkout -'

# Undo last commit safely (keeps all your changes staged)
alias gundo='git reset --soft HEAD~1'

# Stash helpers
alias gstash='git stash'
alias gpop='git stash pop'
alias gdiff='git diff --staged'  # View diff of only what you have staged

# --------------------------------------------------------------- #

###### Terminal & macOS Quality-of-Life
# 1. Quickly reload your config after making changes to ~/.zshrc
alias reload='source ~/.zshrc && echo "zshrc reloaded!"'

# 2. Make directory and immediately cd into it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# 3. Quick directory hops
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'              # Jump back to previous directory

# 4. Port inspector & killer (lifesaver when Java/Node servers don't release ports like 8080)
port() {
    lsof -i :"$1"
}
killport() {
    lsof -ti :"$1" | xargs kill -9 && echo "Killed process on port $1"
}

# 5. Clean PATH display (one entry per line instead of unreadable colon soup)
alias path='echo $PATH | tr ":" "\n"'

# 6. Clear Screen
alias cls='clear'

# --------------------------------------------------------------- #
# Smart Case-Insensitive Tab-Completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# Load version control information
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd() { vcs_info }

# --------------------------------------------------------------- #
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{242}${(l:$COLUMNS::─:)}%f
%F{201}%n%f %F{green}[${PWD/#$HOME/~}]%f%F{202}${vcs_info_msg_0_}%f
%F{201}>>❯❯%f '

# --------------------------------------------------------------- #

# SnLocalSetup aliases
alias zboot='$HOME/Documents/repos/myRepos/SnLocalSetup/zboot.sh'
alias setup='$HOME/Documents/repos/myRepos/SnLocalSetup/setup.sh'
alias zdump='$HOME/Documents/repos/myRepos/SnLocalSetup/zdump.sh'


# Added by Windsurf
export PATH="$PATH:/Applications/Windsurf.app/Contents/Resources/app/bin"
alias python=python3

# Created by `pipx` on 2025-10-31 12:18:22
export PATH="$PATH:$HOME/.local/bin"

# Windsurf surf command - add ~/bin to PATH
export PATH="$HOME/bin:$PATH"


export PATH="$PATH:/Applications/ServiceNow CLI/bin"

# Added by Devin
export PATH="$HOME/.local/bin:$PATH"

# Added by Devin
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# Added by Antigravity IDE
export PATH="$HOME/.antigravity-ide/antigravity-ide/bin:$PATH"

alias antigravity="antigravity-ide"

# ----------------------------------------
# --- Auto-start ServiceNow Dev Server with Race-Condition Guard ---
# --- Zero-Lag Auto-start ServiceNow Dev Server ---
(
    SERVER_PORT=9999
    LOCK_DIR="/tmp/servicenow_server_launch.lock"

    # Use 'nc' (netcat) - it is significantly faster than lsof
    if ! nc -z localhost $SERVER_PORT >/dev/null 2>&1; then
        if mkdir "$LOCK_DIR" 2>/dev/null; then
            # Start the server silently without blocking the prompt
            (cd ~/Documents/repos/chrome-extension/servicenow-dev && nohup npm run server > ~/.servicenow-server.log 2>&1 &)
            sleep 5
            rmdir "$LOCK_DIR" 2>/dev/null
        fi
    fi
) &| 
# The &| puts this entire check in the background immediately
# -------------------------------------------------

