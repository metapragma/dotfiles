# Interactive shell setup.
# Environment and PATH live in .zprofile.

typeset -U path PATH
: ${DOTFILES:=$HOME/dotfiles}

# --- oh-my-zsh ---------------------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""                         # the prompt comes from starship
zstyle ':omz:update' mode reminder
ENABLE_CORRECTION="true"
HIST_STAMPS="dd.mm.yyyy"

# Paste instantly. The magic paste widgets insert pasted text one character at
# a time, and syntax highlighting then redraws the line after each character.
DISABLE_MAGIC_FUNCTIONS="true"

# Load nvm on first use of nvm, node, npm, etc. Loading it eagerly costs ~0.8 s.
zstyle ':omz:plugins:nvm' lazy yes

# Auto-start tmux only in standalone terminal apps, not in editor terminals.
[[ $TERM_PROGRAM == (ghostty|iTerm.app|Apple_Terminal) ]] && ZSH_TMUX_AUTOSTART=true

# Angular CLI completion. `ng completion script` takes ~1.4 s, so cache it
# in a directory that oh-my-zsh adds to fpath, and refresh it when ng changes.
if (( $+commands[ng] )); then
  _ng_comp="$ZSH/cache/completions/_ng"
  [[ $_ng_comp -nt $commands[ng] ]] || ng completion script >| $_ng_comp 2>/dev/null
  unset _ng_comp
fi

plugins=(
  aliases
  aws
  brew
  colored-man-pages
  command-not-found
  cp
  docker
  fzf
  git
  nmap
  node
  nvm
  ssh
  timer
  tmux
  uv
  zoxide
  zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

# --- history -----------------------------------------------------------------

HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS

# --- keys and aliases --------------------------------------------------------

bindkey "^[[1;3D" backward-word      # Option + Left
bindkey "^[[1;3C" forward-word       # Option + Right

source "$DOTFILES/zsh/.alias"

# --- prompt and highlighting -------------------------------------------------

eval "$(starship init zsh)"

# Must be sourced last.
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
