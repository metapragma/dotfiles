#!/usr/bin/env bash
# Link dotfiles into $HOME. Safe to run again: existing links are refreshed,
# and real files are moved to ~/.dotfiles-backup/<timestamp> first.
#
#   ./install.sh          link everything
#   ./install.sh --brew   also install the Brewfile

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

# repo path -> target in $HOME
LINKS=(
  "zsh/.zshrc               .zshrc"
  "zsh/.zprofile            .zprofile"
  "git/config               .config/git/config"
  "git/ignore               .config/git/ignore"
  "ssh/config               .ssh/config"
  "tmux/.tmux.conf          .tmux.conf"
  "vim/.vimrc               .vimrc"
  "curl/.curlrc             .curlrc"
  "config/starship.toml     .config/starship.toml"
  "config/zed/settings.json .config/zed/settings.json"
  "config/gh/config.yml     .config/gh/config.yml"
  "config/nvim              .config/nvim"
)

link() {
  local src="$DOTFILES/$1" dest="$HOME/$2"

  if [[ -L $dest && $(readlink "$dest") == "$src" ]]; then
    return
  fi

  if [[ -e $dest || -L $dest ]]; then
    mkdir -p "$BACKUP/$(dirname "$2")"
    mv "$dest" "$BACKUP/$2"
    echo "backed up ~/$2"
  fi

  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "linked ~/$2"
}

for entry in "${LINKS[@]}"; do
  read -r src dest <<< "$entry"
  link "$src" "$dest"
done

if [[ ${1:-} == --brew ]]; then
  brew bundle --file="$DOTFILES/Brewfile"
fi

[[ -f ~/.ssh/config.local ]] || echo "note: create ~/.ssh/config.local for your SSH hosts"
[[ -n $(git config --global user.email) ]] || echo "note: set your identity in ~/.gitconfig"
