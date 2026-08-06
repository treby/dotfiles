#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# Homebrew: /opt/homebrew (Apple Silicon), /usr/local (Intel)
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/sbin:/sbin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
export EDITOR=vi
alias gg='git grep -H --heading --break'
alias tailf='tail -f'
alias rm='command rm'

export MASTER_OPTIONS="--my_file=$HOME/.my.cnf"

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco)
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

[ -x "$HOME/.claude/local/claude" ] && alias claude="$HOME/.claude/local/claude"

# Machine-local settings (kept out of the repo)
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# Auto-start tmux unless it is missing or we are already inside one
if command -v tmux >/dev/null && [ -z "$TMUX" ]; then
  tmux
fi
