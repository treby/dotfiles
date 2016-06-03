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
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi
export PATH="$HOME/.rbenv/shims:$PATH"
export EDITOR=vi
alias gg='git grep -H --heading --break'
alias tailf='tail -f'
