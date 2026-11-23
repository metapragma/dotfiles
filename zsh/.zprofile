# Login shell: environment and PATH.
# Interactive setup (prompt, plugins, aliases) lives in .zshrc.

typeset -U path PATH

export DOTFILES="$HOME/dotfiles"

eval "$(/opt/homebrew/bin/brew shellenv)"

source "$DOTFILES/zsh/.exports"

# Put the default nvm Node on PATH, so global CLIs such as ng work
# before nvm itself is loaded (it loads lazily in .zshrc).
if [[ -r $NVM_DIR/alias/default ]]; then
  path=("$NVM_DIR/versions/node/v$(<$NVM_DIR/alias/default)/bin"(N) $path)
fi

if /usr/libexec/java_home -v 17 &>/dev/null; then
  export JAVA_HOME=$(/usr/libexec/java_home -v 17)
  path=($JAVA_HOME/bin $path)
fi

path=(
  $HOME/.local/bin
  $GOPATH/bin
  $PNPM_HOME
  $HOME/.antigravity/antigravity/bin(N)
  /Applications/Postgres.app/Contents/Versions/latest/bin(N)
  $path
  "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"(N)
)

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
