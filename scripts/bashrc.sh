# the real ~/.bashrc sources this

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias gs="git status"
alias gaa="git add -A"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gc="git checkout"
alias gri="git rebase -i"
alias grc="git rebase --continue"
alias gcm="git commit -m"
alias gca="git commit --amend -m"
alias gcan="git commit --amend --no-edit"
alias gss="git stash save"
alias gsp="git stash pop"
alias gsl="git stash list"
alias gm="git merge"
alias gd="git diff"

export VISUAL='code --wait'
export EDITOR=$VISUAL
