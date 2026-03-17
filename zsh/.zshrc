export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export PATH=$PATH:~/.cargo/bin/:~/.local/bin/

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

POSH=agnoster

plugins=(
    git
    sudo
    web-search
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    copyfile
    copybuffer
    dirhistory
)

source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# -----------------------------------------------------
# Fastfetch
# -----------------------------------------------------
if [[ $(tty) == *"pts"* ]]; then
    fastfetch
fi
# -----------------------------------------------------
# ALIASES
# -----------------------------------------------------
alias c='clear'
alias nf='fastfetch'
alias pf='fastfetch'
alias ff='fastfetch'
alias ls='eza -a --icons=always'
alias ll='eza -al --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'
alias shutdown='systemctl poweroff'
alias v='$EDITOR'
alias vim='$EDITOR'
alias wifi='nmtui'
alias Qtile='startx'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias svim='sudo -E nvim'

(cat ~/.cache/wal/sequences &)


