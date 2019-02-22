source ~/.zplug/init.zsh

export HISTFILE=~/.zhistory
setopt append_history
setopt share_history # share history between multiple shells
setopt INC_APPEND_HISTORY # Write after each command
export HISTSIZE=10000
export SAVEHIST=10000
setopt hist_fcntl_lock # use OS file locking
setopt hist_expire_dups_first # Expire duplicate entries first when trimming history.
setopt hist_ignore_all_dups # Delete old recorded entry if new entry is a duplicate.
setopt hist_lex_words # better word splitting, but more CPU heavy
setopt hist_reduce_blanks # Remove superfluous blanks before recording entry.
setopt hist_save_no_dups
setopt HIST_IGNORE_SPACE

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "chrissicool/zsh-256color"
zplug "srijanshetty/docker-zsh"
zplug "unixorn/git-extra-commands"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh

# Load theme file
setopt prompt_subst # Make sure prompt is able to be generated properly.
zplug "caiogondim/bullet-train.zsh", use:bullet-train.zsh-theme

BULLETTRAIN_PROMPT_ORDER=(
    time
    status
    custom
    context
    dir
    screen
    perl
    ruby
    virtualenv
    aws
    go
    elixir
    git
    cmd_exec_time
)

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
       echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose


export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export VISUAL=vim

alias docker-rm-all='docker rm $(docker ps -a -q)'

export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export MAVEN_OPTS='-Djava.awt.headless=true -Xmx4096m'

alias gs='git status'
alias gl='git log --decorate --date=short --pretty=format:"%C(auto)%h %C(cyan)%ad%Creset %Cgreen%cN %C(auto)%d%Creset %s" --graph'

export LESS='-j10R'
export LESS_TERMCAP_so=$'\E[01;33;03;40m'

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

function pb() {
  if [ -t 0 ]; then
    cat $1 | pbcopy
  else
    pbcopy < /dev/stdin
  fi
}

autoload -U colors
colors

[ -f ~/workspace/z/z.sh ] && source ~/workspace/z/z.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


alias k='kubectl '

export GOPATH=~/workspace/goenvs/
