# export PATH="/usr/local/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
alias love="/Applications/love.app/Contents/MacOS/love"
alias g="/usr/bin/git"
alias v="/usr/local/bin/vim"
alias l="ls -lahG"
export EDITOR="/usr/local/bin/vim"
export GREP_OPTIONS="--color=auto"
# nvm use default > /dev/null
ssh-add ~/.ssh/id_rsa &> /dev/null
export PATH="/usr/local/sbin:$PATH"
eval "$(rbenv init -)"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1="\[\e[34m\]\w\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\] >> "
