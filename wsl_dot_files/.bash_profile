set -o vi
export DARK_SKY_KEY=d021c6ab4940997d6a5440c4e72a1006
export SPOTIFY_KEY=5d7420caf8ab4b6cb90d56f27348cf1e
eval "$(rbenv init -)"

alias cl="clear"
alias cdls=". cdls"
alias ggl="git log --oneline --abbrev-commit --all --graph --decorate --color"
alias go_aops="go_home; cd repos/Analytics-Ops/"
alias go_control="go_home; cd repos/control"
alias go_etl="go_home; cd repos/etl/"
alias go_home="cd ~"
alias ls="ls -lsah"
alias go_LCP="go_home; cd repos/LCPSQLANL01/"
alias go_sleep="pmset sleepnow"
alias go_pypro="go_home; cd personal_repos/pyProjects/"
alias go_mssql="go_home; cd repos/mssql/"
alias go_postgres="go_home; cd repos/postgresql/"
alias go_rpt1="go_home; cd repos/rpt1/"
alias go_swap="go_home; cd personal_repos/pyProjects/locallibrary/catalog/"
alias go_swapt="go_home; cd personal_repos/pyProjects/locallibrary/catalog/templates/catalog/"
alias go_weath="go_home; cd personal_repos/pyProjects/weatherlog/tracker"
alias novim="set -o emacs"
alias pentopen="open -a Data\ Integration"
alias get_temp="python3 find_temp.py"
alias reload_profile=". ~/.bash_profile"

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
