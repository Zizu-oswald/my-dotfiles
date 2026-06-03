# My Dotfiles

Personal Linux development environment configuration.

Managed with **GNU Stow** + **Git**.

## Included configuration

* Zsh
* Oh My Zsh
* Powerlevel10k
* tmux
* Neovim
* Git
* Xresources
* shell plugins & completions

---

# Requirements

Install the required packages for your distribution.

---

## Arch Linux

```bash
sudo pacman -S \
git \
stow \
zsh \
tmux \
neovim \
fzf \
bat \
eza \
ripgrep \
fd \
curl \
wget \
yazi
```

---

## Debian / Ubuntu (APT)

```bash
sudo apt update

sudo apt install -y \
git \
stow \
zsh \
tmux \
neovim \
fzf \
bat \
eza \
ripgrep \
fd-find \
curl \
wget \
yazi
```

Notes:

* Debian/Ubuntu package for `fd` is named **`fd-find`**
* command alias may be needed:

```bash
ln -s $(which fdfind) ~/.local/bin/fd
```

---

## Fedora / RHEL / RPM based

```bash
sudo dnf install -y \
git \
stow \
zsh \
tmux \
neovim \
fzf \
bat \
eza \
ripgrep \
fd-find \
curl \
wget \
yazi
```

---

# Clone repository

SSH:

```bash
git clone git@github.com:Zizu-oswald/my-dotfiles.git ~/.dotfiles
```

HTTPS:

```bash
git clone https://github.com/Zizu-oswald/my-dotfiles.git ~/.dotfiles
```

---

# Create symlinks using GNU Stow

Move into repository:

```bash
cd ~/.dotfiles
```

Stow configs:

```bash
stow .
```

---

# Bootstrap dependencies

Run:

```bash
./install.sh
```

The script installs:

* Oh My Zsh
* Powerlevel10k
* Zsh plugins
* tmux plugins
* additional shell dependencies

---

# Set Zsh as default shell

```bash
chsh -s $(which zsh)
```

Logout/login afterward.

---

# Neovim

After first launch:

```bash
nvim
```

Plugins should install automatically.

---

# Updating

Update repo:

```bash
cd ~/.dotfiles
git pull
```

Restow:

```bash
stow -R .
```

Update dependencies:

```bash
./install.sh
```
