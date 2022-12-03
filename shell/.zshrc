
# when migrating from bash
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# zsh theme
ZSH_THEME="agnoster"

# omz update reminder
zstyle ':omz:update' mode reminder

# Uncomment the following   line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# command autocorrection
ENABLE_CORRECTION="true"

# completion dots on longers ops
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# date format
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(
    web-search
    git
    aliases
    colored-man-pages
    colorize
    command-not-found
    cp
    tmux
    rbw
    zoxide
    nvm
    zsh-autosuggestions
)

# for some reason needs to be sourced before the prompt_context call
source $ZSH/oh-my-zsh.sh

ZSH_TMUX_AUTOSTART=true

# todo: fix zsh prompt (username:host:etc)
ZSH_THEME_TERM_TITLE_IDLE=%~
ZSH_THEME_TERM_TAB_TITLE_IDLE=%~

# remove own and machine name from prompt
prompt_context() {}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# turn on autosuggestions & syntax highlighting
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# turn on aliases from .alias
source $HOME/dotfiles/shell/.alias

# import...exports, which are useful variables
source $HOME/dotfiles/shell/.exports

source $(brew --prefix nvm)/nvm.sh

# pnpm
export PNPM_HOME="/Users/robert/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

