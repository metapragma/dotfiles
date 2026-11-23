# dotfiles

Shell, git, SSH and editor settings for macOS.

## Install

```bash
git clone git@github.com:metapragma/dotfiles.git ~/dotfiles
~/dotfiles/install.sh --brew
```

`install.sh` links each file into `$HOME`. It is safe to run again. Existing
files are moved to `~/.dotfiles-backup/<timestamp>` before they are replaced.
`--brew` also installs everything in the `Brewfile`.

The shell expects the repo at `~/dotfiles`.

## Layout

| Path | Linked to | Contents |
|---|---|---|
| `zsh/` | `~/.zshrc`, `~/.zprofile` | oh-my-zsh setup, PATH, `.exports`, `.alias` |
| `git/` | `~/.config/git/` | shared git config (delta, diff3) and global ignore |
| `ssh/` | `~/.ssh/config` | shared SSH defaults |
| `config/` | `~/.config/` | starship, Zed, gh, Neovim (kickstart.nvim) |
| `tmux/` | `~/.tmux.conf` | tmux config and theme |
| `vim/` | `~/.vimrc` | vim config |
| `curl/` | `~/.curlrc` | curl defaults |
| `macos/` | — | iTerm color scheme (import by hand) |
| `Brewfile` | — | Homebrew packages; refresh with `brew bundle dump --force --no-vscode --no-uv` |

## Machine-specific files

This repo is public. Keep hosts, names and anything private out of it:

- `~/.ssh/config.local`: SSH hosts. `ssh/config` includes it.
- `~/.gitconfig`: name, email, and per-machine git settings. Git reads it
  after `~/.config/git/config`, so it wins.
- `~/.config/gh/hosts.yml`: GitHub CLI login token. Never commit it.
