fastfetch
# ======================================================
# 1. INSTANT PROMPT - ТОЛЬКО В САМОМ НАЧАЛЕ
# ======================================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ======================================================
# 2. ОСНОВНЫЕ НАСТРОЙКИ
# ======================================================
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:$HOME/go/bin
export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git 
    zsh-autosuggestions 
    zsh-bat 
    you-should-use 
    eza 
    fzf-zsh-plugin 
    fzf-tab 
    zsh-completions
    zsh-abbr 
)

# ======================================================
# 3. ЗАГРУЗКА OH-MY-ZSH (ОДИН РАЗ!)
# ======================================================
source $ZSH/oh-my-zsh.sh

# ======================================================
# 4. ДОПОЛНИТЕЛЬНЫЕ ПЛАГИНЫ
# ======================================================
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Настройки подсветки синтаксиса
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=blue'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=red,bold'
ZSH_HIGHLIGHT_STYLES[comment]='fg=black,bold'

# ======================================================
# 5. FZF и ZOXIDE
# ======================================================
# Используем fd вместо find, если установлен
if command -v fdfind >/dev/null 2>&1; then
  export FZF_ALT_C_COMMAND='fdfind --type d --hidden --follow --exclude .git --exclude node_modules'
else
  export FZF_ALT_C_COMMAND='find . -type d -not -path "*/.git*" -not -path "*/node_modules*"'
fi

# if command -v fd >/dev/null; then
#     export FZF_CTRL_T_COMMAND='fd --type f --hidden --follow --exclude .git'
# fi

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# ======================================================
# 6. АЛИАСЫ
# ======================================================
alias zshconfig="nvim ~/.zshrc"
alias niriconfig="nvim ~/.config/niri/config.kdl"
alias ff='fastfetch'
alias fff='fastfetch --config neofetch'
alias la='exa -lah --no-user'
alias ll='exa -lh --no-user'
alias vi='nvim'

alias charge-80='sudo tlp setcharge 0 80'
alias charge-100='sudo tlp fullcharge'
alias charge-normal='sudo tlp setcharge'
alias charge-status='sudo tlp-stat -b | grep -E "charge_control_end_threshold|Charge"'

function y() {
	local tmp="$(mktemp -t yazi-cwd.XXXXXX)"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat "$tmp")" && [ -n "$cwd" ]; then
		cd "$cwd"
	fi
	rm -f "$tmp"
}
# ======================================================
# 7. КЛАВИШИ
# ======================================================
bindkey '^G' fzf-cd-widget
bindkey -s '^y' 'y\n'

# ======================================================
# 8. POWERLEVEL10K КОНФИГУРАЦИЯ
# ======================================================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh-defer fastfetch
# (sleep 3 && fastfetch &)
