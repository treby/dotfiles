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

export GOPATH=$HOME/go
export PATH="$HOME/.rbenv/shims:/usr/local/bin:/usr/sbin:/sbin:$HOME/google-cloud-sdk/bin:$PATH"
# Customize to your needs...
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
export EDITOR=vi
alias gg='git grep -H --heading --break'
alias tailf='tail -f'
alias rm='command rm'

export MASTER_OPTIONS="--my_file=$HOME/.my.cnf"

PATH="/Users/treby/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/treby/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/treby/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/treby/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/treby/perl5"; export PERL_MM_OPT;
export PATH="$HOME/.embulk/bin:$PATH"

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
tmux
