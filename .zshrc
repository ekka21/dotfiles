#ZSH_THEME="agnoster"
ZSH_THEME="avit"

plugins=(osx git brew history nyan vi-mode vim-interaction tmux aws python docker terraform kubectl)
COMPLETION_WAITING_DOTS=true
DISABLE_AUTO_TITLE=true
unsetopt correct_all

#---PATH-------------
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR='vim -f'
export PATH="/usr/local/bin:/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/.rvm/gems/ruby-2.3.1/bin"
export PATH="$PATH:/usr/local/opt/inetutils/libexec/gnubin"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export ANDROID_HOME=/Users/ek/Library/Android/sdk
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export PATH=$PATH:/usr/local/bin
export ANSIBLE_FORKS=60
#---osx-----------
alias lsa='ls -lah'
alias zshconfig="vim ~/.zshrc"
alias sshconfig="vim ~/.ssh/config"
alias code="cd ~/Code"
alias bull="cd ~/Code/bullmoose"
alias master="cd ~/Code/bullmoose/master"
alias child="cd ~/Code/bullmoose/child"
alias infra="cd ~/Code/infra"
alias portend="cd ~/Code/infra/portend"
alias desk="cd ~/desktop"
alias doc="cd ~/Documents"
alias down="cd ~/Downloads"
alias o="open ."
alias szsh='source ~/.zshrc'
alias www='cd /var/www/domains'
alias vm='cd /Users/ek/VM'
alias hg='history | grep'
alias c='clear'
alias cat='bat'

#---Networking--------
alias serve='python -m SimpleHTTPServer 8080'
alias addhost='sudo vim /etc/hosts'
alias flushdns="dscacheutil -flushcache"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

#---Git--------------
alias ga.="git add ."
alias gcm="git commit -m"
alias gcmw="git commit -m 'wip'"
alias gcam="git commit -am"
alias gpo="git push origin"
alias gba="git branch -a"
alias grv="git remote -v"
alias nah='git fetch --all && git reset --hard origin/develop'
alias gpa='git push origin develop && git push origin master && git push --tags'

#---Docker--------
alias d="docker"
alias di="docker images"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias din="docker inspect"
alias drmi='docker rmi -f $(sudo docker image ls -f "dangling=true" -q)'
alias drm='docker rm $(docker ps -aq)'
alias dc='docker-compose'
alias dtop='_dTop'
function _dTop(){
  if [ $# -eq 0 ]
    then docker stats --no-stream;
    else docker stats --no-stream | grep $1;
  fi
}
#---Tmux------
alias tattach="tmux a -t"

#---Misc---------
alias weather='curl wttr.in/stl'

#---K8s---------
alias kc='kubectl'
alias awsprod='awsp prattle && ks awsprod'
alias azdev='ks azdev'

#---AWS----
. ~/.dotfiles/.aws.aliases
#---k8s---
function _kubectlSwitchContext() {
   if [[ -n $1 ]]; then
       export KUBECONFIG=~/.kube/config-$1
       echo "Switched to cluster: $1";
   fi
};

alias ks='_kubectlSwitchContext'
alias killport='_killPort'
alias killpods="kubectl get pods --field-selector=status.phase=Failed | awk '{ if(NR>1)print $1}' | xargs kubectl delete pods"

function _killPort() { lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9 }

#---Helm---
. ~/.dotfiles/.helm.completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ek/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/ek/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/ek/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/ek/google-cloud-sdk/completion.zsh.inc'; fi
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

source /usr/local/etc/bash_completion.d/az
alias t9='brew switch terraform 0.9.6'
alias t11='brew switch terraform 0.11.11'

