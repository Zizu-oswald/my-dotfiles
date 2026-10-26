# dotfiles

My Linux setup: Zsh, tmux, Neovim (LazyVim), kitty, niri and friends.
Configs live in this repo and are symlinked into `$HOME` with [GNU Stow](https://www.gnu.org/software/stow/).

## What's inside

| Path | What |
| --- | --- |
| `.zshrc`, `.p10k.zsh` | Zsh + Oh My Zsh + Powerlevel10k |
| `.tmux.conf` | tmux with TPM, resurrect/continuum, themepack |
| `.config/nvim` | Neovim on top of LazyVim |
| `.config/kitty` | kitty terminal |
| `.config/yazi` | yazi file manager |
| `.config/fuzzel` | fuzzel launcher |
| `.config/fastfetch` | fastfetch |
| `.gitconfig`, `.vimrc`, `.bashrc`, `.fzf.zsh` | misc |
| `other/niri/config.kdl` | niri compositor (not stowed, see below) |
| `other/keyd/default.conf` | keyd key remapping (not stowed, see below) |

## Install

### 1. Packages

Arch Linux:

```bash
sudo pacman -S --needed git stow zsh tmux neovim fzf bat eza ripgrep fd curl wget yazi
```

Debian / Ubuntu:

```bash
sudo apt update
sudo apt install -y git stow zsh tmux neovim fzf bat eza ripgrep fd-find curl wget
```

> On Debian/Ubuntu some packages (notably `fzf` and `neovim`) are too old for these configs.
> `.zshrc` needs `fzf >= 0.48` for `fzf --zsh`, LazyVim needs `neovim >= 0.11`; install newer versions from upstream if needed.

### 2. Clone

The repo must be cloned to `~/.dotfiles`:

```bash
git clone https://github.com/Zizu-oswald/my-dotfiles.git ~/.dotfiles
# or via SSH
git clone git@github.com:Zizu-oswald/my-dotfiles.git ~/.dotfiles
```

### 3. Run the installer

```bash
cd ~/.dotfiles
./install.sh
```

The script:

1. Clones Oh My Zsh, Powerlevel10k, zsh plugins, zsh-syntax-highlighting and tmux plugins into the repo
   (they're git-ignored and linked into `$HOME` together with the rest).
2. Runs `stow --restow .` to symlink everything into `$HOME`.

It is safe to run repeatedly — already installed repositories are skipped.

Options:

| Flag | Description |
| --- | --- |
| `-u`, `--update` | `git pull` all installed plugins |
| `-n`, `--no-stow` | only clone repositories, don't run stow |
| `-h`, `--help` | show help |

If stow complains about conflicts, a real file (e.g. a default `~/.zshrc`) is in the way.
Move it out and run the script again:

```bash
mv ~/.zshrc ~/.zshrc.bak
./install.sh
```

### 4. Make zsh the default shell

```bash
chsh -s "$(command -v zsh)"
```

Log out and back in.

### 5. First launch

- **Neovim** — run `nvim`, lazy.nvim installs the plugins automatically.
- **tmux** — plugins are already cloned; if something is missing press `prefix + I` to install via TPM.
- **Powerlevel10k** — the config is already in `.p10k.zsh`; run `p10k configure` to redo it.

## Local overrides

Machine-specific settings that shouldn't be committed go to `~/.zshrc.local` — it's sourced at the end of `.zshrc` if it exists.

## Not stowed: `other/`

These configs live outside `$HOME` or are machine-specific, so they're copied/linked by hand.

**keyd** (CapsLock = Ctrl/Esc, Space-held vim layer, etc.):

```bash
sudo pacman -S keyd
sudo mkdir -p /etc/keyd
sudo ln -sf ~/.dotfiles/other/keyd/default.conf /etc/keyd/default.conf
sudo systemctl enable --now keyd
```

**niri** (expects DankMaterialShell for the `dms/*.kdl` includes, plus kitty, fuzzel, cliphist):

```bash
mkdir -p ~/.config/niri
ln -sf ~/.dotfiles/other/niri/config.kdl ~/.config/niri/config.kdl
```

## Updating

```bash
cd ~/.dotfiles
git pull
./install.sh --update
```

## Adding a new config

1. Move it into the repo keeping the path relative to `$HOME`, e.g. `~/.config/foo` → `~/.dotfiles/.config/foo`.
2. Run `stow --restow .` (or `./install.sh`).
3. Commit.

Files matching `.stow-local-ignore` (`*.md`, `*.sh`, `other/`, `.git`, …) are never linked.
