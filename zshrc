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
HYPHEN_INSENSITIVE="true" # Hyphen insensitive completion _ and - will be interchangeable.
DISABLE_AUTO_UPDATE="true" # Disable auto-update checks.
VI_MODE_SET_CURSOR=true
# Autosuggestions
bindkey '^ ' autosuggest-execute

# User configuration
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

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

export EDITOR="nvim"
export VISUAL="nvim"

# Prefer color in commands
export CLICOLOR=1

# Configure source-highlight (requires source-highlight package)
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS=' -R --mouse'

export BAT_THEME=GitHub

# Configure ls colors
eval `dircolors ~/.dircolors`

source ~/.zsh_alias

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

# fnm
export PATH="$HOME/.fnm":$PATH
eval "`fnm env`"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(starship init zsh)"

# Increase file limits
ulimit -n 512

source ~/.zsh.theme
source ~/.zsh_secret
