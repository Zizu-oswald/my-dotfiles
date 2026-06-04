#!/bin/bash

set -e

DOTFILES="$HOME/.dotfiles"
CUSTOM="$HOME/.dotfiles/.oh-my-zsh/custom"
TMUXPLUG="$DOTFILES/.tmux/plugins"

mkdir -p "$TMUXPLUG"

if [ ! -d "$HOME/.dotfiles/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh "$HOME/.dotfiles/.oh-my-zsh"
fi

mkdir -p "$CUSTOM/plugins"
mkdir -p "$CUSTOM/themes"

if [ ! -d "$CUSTOM/plugins/zsh-bat" ]; then
    git clone https://github.com/fdellwing/zsh-bat "$CUSTOM/plugins/zsh-bat"
fi

if [ ! -d "$CUSTOM/plugins/fzf-tab" ]; then
    git clone https://github.com/aloxaf/fzf-tab "$CUSTOM/plugins/fzf-tab"
fi

if [ ! -d "$CUSTOM/plugins/fzf-zsh-plugin" ]; then
    git clone https://github.com/unixorn/fzf-zsh-plugin "$CUSTOM/plugins/fzf-zsh-plugin"
fi

if [ ! -d "$CUSTOM/plugins/zsh-you-should-use" ]; then
    git clone https://github.com/MichaelAquilina/zsh-you-should-use "$CUSTOM/plugins/zsh-you-should-use"
fi

if [ ! -d "$CUSTOM/plugins/zsh-abbr" ]; then
    git clone --recurse-submodules https://github.com/olets/zsh-abbr "$CUSTOM/plugins/zsh-abbr"
fi

if [ ! -d "$CUSTOM/plugins/zsh-completions" ]; then
    git clone https://github.com/zsh-users/zsh-completions "$CUSTOM/plugins/zsh-completions"
fi

if [ ! -d "$CUSTOM/plugins/zsh-autocomplete" ]; then
    git clone https://github.com/marlonrichert/zsh-autocomplete "$CUSTOM/plugins/zsh-autocomplete"
fi

if [ ! -d "$CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$CUSTOM/themes/powerlevel10k" ]; then
    git clone https://github.com/romkatv/powerlevel10k "$CUSTOM/themes/powerlevel10k"
fi

if [ ! -d "$HOME/.dotfiles/.zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.dotfiles/.zsh-syntax-highlighting"
fi

if [ ! -d "$TMUXPLUG/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TMUXPLUG/tpm"
fi

if [ ! -d "$TMUXPLUG/tmux-themepack" ]; then
    git clone https://github.com/jimeh/tmux-themepack "$TMUXPLUG/tmux-themepack"
fi

if [ ! -d "$TMUXPLUG/tmux-continuum" ]; then
    git clone https://github.com/tmux-plugins/tmux-continuum "$TMUXPLUG/tmux-continuum"
fi

if [ ! -d "$TMUXPLUG/tmux-resurrect" ]; then
    git clone https://github.com/tmux-plugins/tmux-resurrect "$TMUXPLUG/tmux-resurrect"
fi

if [ ! -d "$TMUXPLUG/tmux-sensible" ]; then
    git clone https://github.com/tmux-plugins/tmux-sensible "$TMUXPLUG/tmux-sensible"
fi
