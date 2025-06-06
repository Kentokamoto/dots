# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/Users/kentokamoto/.zshrc'

fpath+=~/.zsh/completion
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Auto Completion Path

# Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="essembeh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

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

# Skip verification
ZSH_DISABLE_COMPFIX="true"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         docker
         docker-compose
         #archlinux
         #vi-mode
         #docker
         #docker-compose
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Prompt settings
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# Other configs
LS_COLORS=$LS_COLORS:'di=0;36:'
# ex=1;37:' ; export LS_COLORS
#TERM=rxvt-unicode-256color
# Aliases
alias def="/usr/bin/sdcv --color"
alias beep="ping 8.8.8.8"
alias emacs="emacs -nw"
alias iftop="sudo iftop -i en0"
alias mongostart="mongod --config /opt/homebrew/etc/mongod.conf --fork"
if [ -f ~/.zsh_work_aliases ]; then
  source ~/.zsh_work_aliases
fi
#vi mode
#bindkey -v
#emacs mode
bindkey -e

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
export KEYTIMEOUT=1

HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=2000
IGNOREEOF=10

# Work Related Things
#Go
if [[ -d "$HOME/go/" ]]; then
    export PATH=$PATH:/usr/local/go/bin
fi
if [[ -d "/Applications/Visual\ Studio\ Code.app/" ]]; then
    export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
fi

# homebrew
if [[ ($(arch) == "arm64") ]]; then
    eval $(/opt/homebrew/bin/brew shellenv)
else
    eval $(/usr/local/bin/brew shellenv)
fi

if [[ $(command -v brew &>/dev/null) -eq 0 ]]; then
    eval $(brew shellenv)
fi
export HOMEBREW_NO_AUTO_UPDATE=1 

# Lazy Load NVM
load-nvm() {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
}

nvm() {
    unset -f nvm
    load-nvm
    nvm "$@"
}

node() {
    unset -f node
    load-nvm
    node "$@"
}

npm() {
    unset -f npm
    load-nvm
    npm "$@"
}

pnpm() {
    unset -f pnpm
    load-nvm
    pnpm "$@"
}

yarn() {
    unset -f yarn
    load-nvm
    yarn "$@"
}

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
eval "$(pyenv init -)"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Ruby
#export GEM_HOME=$HOME/.gems
#export PATH=$HOME/.gems/bin:$PATH
#source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
#source /opt/homebrew/opt/chruby/share/chruby/auto.sh
#chruby ruby-3.1.3


eval "$(direnv hook bash)"

export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# bun completions
[ -s "/Users/kento/.bun/_bun" ] && source "/Users/kento/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
