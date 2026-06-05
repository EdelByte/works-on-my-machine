# Shell defaults
HISTCONTROL=ignoreboth
shopt -s cdspell
shopt -s direxpand

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# Grep
alias grep='grep --color=auto'

# Custom Git Aliases
gg() { git add --all && git commit -m "$1" && git push; }
ggg() { git add --all && git commit -m "$1" && git push; }
alias reload='source ~/.bashrc'
alias refresh='source ~/.bashrc'
