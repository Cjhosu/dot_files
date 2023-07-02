set -o vi

alias cl="clear"
alias cdls=". cdls"
alias ggl="git log --oneline --abbrev-commit --all --graph --decorate --color"
alias go_sleep="pmset sleepnow"
alias ls="exa -la"
alias novim="set -o emacs"
alias get_temp="python3 find_temp.py"
alias reload_profile=". ~/.bash_profile"
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
# Git branch in prompt.

parse_git_branch() {

    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}
#export CLICOLOR=1

#export LSCOLORS=ExFxBxDxCxegedabagacad

export PS1="\[\033[32m\]\u \\[\033[32;1m\]\W\[\033[32m\]\$(parse_git_branch) $ "

parse_git_branch() {

git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

}
#export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch \W\[\033[1;36])\[\033[32m\] $ "
ssh-add -L &> /dev/null
if [ $? -eq 1 ]; then
  ssh-add
fi
tfind () {
        findfile=$1
        shift
        tree -FC --prune -P "*$findfile*" $@
}
