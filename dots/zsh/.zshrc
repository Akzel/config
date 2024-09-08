export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export MANPAGER='nvim +Man!'
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode auto
ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_CUSTOM=$ZSH/custom
plugins=()
export EDITOR='nvim'
export VISUAL='nvim'
alias "bt"='bluetoothctl'
alias "btc"='echo "h:headphones\tq:qudelix\ts:speakers"'
alias "btch"='bluetoothctl connect 78:2B:64:CE:B0:95'
alias "btcq"='bluetoothctl connect 98:8E:79:00:75:FD'
alias "btcs"='bluetoothctl connect 08:DF:1F:42:B4:50'
source <(fzf --zsh)
