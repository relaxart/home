# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="xiong-chiamiov-plus"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=5

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git docker docker-compose kubectl)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

### Exports
#go
export GOPATH=$HOME/Projects/go
export GOBIN=$HOME/Projects/go
export PATH="$GOBIN:$PATH" 

alias dr="docker"
alias drrm="docker ps -aq | xargs docker rm -f"
alias drc="docker compose"
alias drccl="docker compose kill && docker compose rm -f"
alias drcup="docker compose up -d"
alias drclf="docker compose logs -f"
alias dbu="docker compose build && docker compose up -d"
alias drps='docker ps --format '\''{{.ID}} {{.Image}}'\'' | nl | awk '\''{ print $1 " "  $2 " " $3 }'\''' 

#git
alias gxclean="git reset --hard && git clean -dffx -e .idea"
alias ghelp="cat ~/.oh-my-zsh/plugins/git/git.plugin.zsh | grep alias | sed 's/alias //' | sed 's/=/ /' | grep -E '^[A-z\!]+'"

#common
alias res="source ~/.zshrc"
alias watch='watch '

#kubernetes
kubcon() {
	CONTEXT=$(kubectl config get-contexts | grep "*" | awk '{ print $2 }')
	kubectl config set-context $CONTEXT --namespace=$1
}

passgen() {
	openssl rand -base64 8
}

eval "$(/opt/homebrew/bin/brew shellenv)"

alias python=python3
alias t=terraform
alias pgen=passgen
alias kcn=kubcon
alias k=kubectl
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/Caskroom/flutter/3.13.2/flutter/bin:$PATH"

