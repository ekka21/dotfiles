#{ Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/libpq/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/ekkachaidanwanichakul/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="avit"
ZSH_THEME="powerlevel10k/powerlevel10k"

# this is just a test
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git docker brew history osx tmux terraform sublime kubectl)
plugins=(zsh-autosuggestions git kubectl ansible sublime terraform kubectx tmux )

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

#---aliases
alias sshconfig="vim ~/.ssh"
alias zshconfig="vim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias ohmyzsh="vim  ~/.oh-my-zsh"
alias weather='curl wttr.in/stl'
alias code="cd ~/Code"
alias infra="cd ~/Code/infra"
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias o="open ."
alias c='clear'
alias addhost='sudo vim /etc/hosts'
alias flushdns="dscacheutil -flushcache"
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
alias hg="history|grep"
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
alias grhm='git reset --hard origin/main'
alias grhma='git reset --hard origin/master'
#---Docker--------
alias d="docker"
alias di="docker images"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias din="docker inspect"
alias drmi='docker rmi -f $(docker image ls -f "dangling=true" -q)'
alias drm='docker rm $(docker ps -aq)'
alias dc='docker-compose'
alias dtop='_dTop'
function _dTop(){
  if [ $# -eq 0 ]
    then docker stats --no-stream;
    else docker stats --no-stream | grep $1;
  fi
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#---AWS---------
alias awsconfig='vi ~/.aws'

#---K8S--------
alias kaf='kubectl apply -f'
alias k='kubectl'
alias kc='kubectx'
alias a='argocd'
alias eks='cd ~/Code/infra/eks'
alias kubeconfig='vi ~/.kube/config'
alias h='helm'
alias wk='watch kubectl'

#---Terragrunt-----
alias ta='terragrunt apply'
#---Telepresence-----
alias t='telepresence'

#---Misc---
alias p='python'
alias mux='tmuxinator'
alias tmuxconfig='vi ~/.tmux.conf'

source ~/.argocd_zsh
typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|flux|fluxctl|stern'

alias ecrlist='_ecrlist'
function _ecrlist() {
  aws ecr list-images --repository-name $1 --output table --profile prod
}

alias killport='_killPort'
function _killPort() { lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9 }

alias awsip='_awsIPLookup'
function _awsIPLookup() {
  aws ec2 describe-instances \
  --query "Reservations[*].Instances[*].{InstanceID:InstanceId,PrivateIP:PrivateIpAddress,Name:Tags[?Key=='Name']|[0].Value,Status:State.Name}"  \
  --filters "Name=tag:Name,Values=$1" \
  --region us-west-2 \
  --output text|awk '{print $3}'|pbcopy
 }
alias b64='_b64'
function _b64(){
  echo -n "$1"|base64|pbcopy
}
