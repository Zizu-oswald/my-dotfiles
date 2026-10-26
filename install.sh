#!/usr/bin/env bash
#
# Bootstrap dotfiles: clone oh-my-zsh, zsh/tmux plugins and link configs with GNU Stow.
#
# Usage: ./install.sh [-u|--update] [-n|--no-stow] [-h|--help]

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OMZ="$DOTFILES/.oh-my-zsh"
OMZ_CUSTOM="$OMZ/custom"
TMUX_PLUGINS="$DOTFILES/.tmux/plugins"

UPDATE=0
STOW=1

# Repositories to install: "<target dir>|<git url>"
REPOS=(
    "$OMZ|https://github.com/ohmyzsh/ohmyzsh"

    "$OMZ_CUSTOM/themes/powerlevel10k|https://github.com/romkatv/powerlevel10k"

    "$OMZ_CUSTOM/plugins/zsh-autosuggestions|https://github.com/zsh-users/zsh-autosuggestions"
    "$OMZ_CUSTOM/plugins/zsh-completions|https://github.com/zsh-users/zsh-completions"
    "$OMZ_CUSTOM/plugins/zsh-autocomplete|https://github.com/marlonrichert/zsh-autocomplete"
    "$OMZ_CUSTOM/plugins/zsh-bat|https://github.com/fdellwing/zsh-bat"
    "$OMZ_CUSTOM/plugins/fzf-tab|https://github.com/aloxaf/fzf-tab"
    "$OMZ_CUSTOM/plugins/fzf-zsh-plugin|https://github.com/unixorn/fzf-zsh-plugin"
    "$OMZ_CUSTOM/plugins/you-should-use|https://github.com/MichaelAquilina/zsh-you-should-use"
    "$OMZ_CUSTOM/plugins/zsh-abbr|https://github.com/olets/zsh-abbr"

    "$DOTFILES/.zsh-syntax-highlighting|https://github.com/zsh-users/zsh-syntax-highlighting"

    "$TMUX_PLUGINS/tpm|https://github.com/tmux-plugins/tpm"
    "$TMUX_PLUGINS/tmux-sensible|https://github.com/tmux-plugins/tmux-sensible"
    "$TMUX_PLUGINS/tmux-resurrect|https://github.com/tmux-plugins/tmux-resurrect"
    "$TMUX_PLUGINS/tmux-continuum|https://github.com/tmux-plugins/tmux-continuum"
    "$TMUX_PLUGINS/tmux-themepack|https://github.com/jimeh/tmux-themepack"
)

# ---------- helpers ----------

if [[ -t 1 ]]; then
    C_BLUE=$'\e[1;34m' C_GREEN=$'\e[1;32m' C_YELLOW=$'\e[1;33m' C_RED=$'\e[1;31m' C_RESET=$'\e[0m'
else
    C_BLUE='' C_GREEN='' C_YELLOW='' C_RED='' C_RESET=''
fi

info() { printf '%s::%s %s\n' "$C_BLUE" "$C_RESET" "$*"; }
ok()   { printf '%s ✓%s %s\n' "$C_GREEN" "$C_RESET" "$*"; }
warn() { printf '%s !%s %s\n' "$C_YELLOW" "$C_RESET" "$*" >&2; }
die()  { printf '%s ✗%s %s\n' "$C_RED" "$C_RESET" "$*" >&2; exit 1; }

usage() {
    cat <<EOF
Usage: $(basename "$0") [options]

Clones oh-my-zsh, zsh plugins, powerlevel10k and tmux plugins into
$DOTFILES, then links everything into \$HOME with GNU Stow.

Options:
  -u, --update    Pull updates for already installed repositories
  -n, --no-stow   Do not run stow
  -h, --help      Show this help
EOF
}

# Clone repo into dir, or pull it when --update is given.
sync_repo() {
    local dir=$1 url=$2 name
    name=$(basename "$dir")

    if [[ -d "$dir/.git" ]]; then
        if (( UPDATE )); then
            if git -C "$dir" pull --ff-only --quiet --recurse-submodules; then
                ok "$name updated"
            else
                warn "$name: failed to update"
            fi
        else
            ok "$name already installed"
        fi
    elif [[ -e "$dir" ]]; then
        warn "$name: $dir exists but is not a git repo, skipping"
    else
        mkdir -p "$(dirname "$dir")"
        git clone --quiet --depth 1 --recurse-submodules --shallow-submodules "$url" "$dir" \
            && ok "$name installed" \
            || die "$name: failed to clone $url"
    fi
}

# ---------- args ----------

while (( $# )); do
    case $1 in
        -u|--update)  UPDATE=1 ;;
        -n|--no-stow) STOW=0 ;;
        -h|--help)    usage; exit 0 ;;
        *)            usage >&2; die "unknown option: $1" ;;
    esac
    shift
done

# ---------- checks ----------

command -v git >/dev/null || die "git is not installed"
(( STOW )) && { command -v stow >/dev/null || die "stow is not installed (or run with --no-stow)"; }

for cmd in zsh tmux nvim fzf bat eza; do
    command -v "$cmd" >/dev/null || warn "$cmd is not installed, some configs won't work"
done

# ---------- install ----------

info "Installing repositories into $DOTFILES"
for entry in "${REPOS[@]}"; do
    sync_repo "${entry%%|*}" "${entry#*|}"
done

if (( STOW )); then
    info "Linking dotfiles into $HOME"
    stow --dir "$DOTFILES" --target "$HOME" --restow . \
        || die "stow failed: move conflicting files out of \$HOME and run again"
    ok "dotfiles linked"
fi

info "Done"
if [[ "$(basename "${SHELL:-}")" != zsh ]]; then
    warn "default shell is not zsh, run: chsh -s \"\$(command -v zsh)\""
fi
