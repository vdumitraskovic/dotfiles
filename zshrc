#~ Antidote loading starts here

# Set the root name of the plugins files (.txt and .zsh) antidote will use.
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Ensure the .zsh_plugins.txt file exists so you can add plugins.
[[ -f ${zsh_plugins}.txt ]] || touch ${zsh_plugins}.txt

# Lazy-load antidote from its functions directory.
fpath=($HOME/.antidote/functions $fpath)
autoload -Uz antidote

# Generate a new static file whenever .zsh_plugins.txt is updated.
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source your static plugins file.
source ${zsh_plugins}.zsh
#~ End of Antidote loading

# Oh My Zsh configuration
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# plugins=(git ssh-agent chucknorris z sublime tmux vi-mode tmuxinator)

# User configuration

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$HOME/bin:$HOME/.local/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# History config
HISTSIZE=10000000
SAVEHIST=10000000

export HISTORY_IGNORE="(ls|cd|pwd|exit|cd)*"

setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.
HIST_STAMPS="yyyy-mm-dd"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR="nvim"
export VISUAL="nvim"

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

source ~/.zsh_alias

# Prefer color in commands
export CLICOLOR=1

# Configure ls colors
eval `dircolors ~/.dircolors`

# Vim mode bindings tweak
autoload -z edit-command-line
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[3~' delete-char
bindkey '^x^x' edit-command-line

# Vim mode indicator
bindkey -v
KEYTIMEOUT=1

function zle-line-init zle-keymap-select {
    case ${KEYMAP} in
        (vicmd)      echo -ne '\e[1 q' ;;
        (main|viins) echo -ne '\e[5 q' ;;
        (*)          echo -ne '\e[1 q' ;;
    esac
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# Autosuggestions
bindkey '^ ' autosuggest-execute

# Config FZF
export FZF_DEFAULT_COMMAND="rg --follow --files --hidden"
export FZF_DEFAULT_OPTS="--color=light"
export FZF_TMUX=1

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

git-checkout() {
    is_in_git_repo || return
    local branches branch
    branches=$(git branch -vv --all --sort=-committerdate | sed "s/^\*[[:space:]]*//" | sed "s/^[[:space:]]*//" | sed "s/^remotes\/[^/]*\///")
    branch=$(fzf --multi <<< $branches | awk '{print $1}')
    if [[ $branch ]]; then
      git checkout $branch
    fi
}

fzf-gb-widget() {
  git-checkout
  zle reset-prompt
}

zle -N fzf-gb-widget
bindkey -r '^g'
bindkey '^g^b' fzf-gb-widget

# Configure source-highlight (requires source-highlight package)
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R --mouse'

export BAT_THEME=GitHub

# fnm
export PATH="$HOME/.fnm":$PATH
eval "`fnm env`"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

# Increase file limits
ulimit -n 512

source ~/.zsh.theme
source ~/.zsh_secret
