#Users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac

set prompt

autoload colors
colors
case ${UID} in
0)
    PROMPT="%{${fg[green]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[green]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[cyan]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[cyan]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT="%{${fg[green]}%}%/%%%{${reset_color}%} "
    PROMPT2="%{${fg[cyan]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[cyan]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[green]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

export LS_COLORS='di=31:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;37:sg=46;37:tw=42;37:ow=43;37'

# auto change directory
#
alias ...='cd ../..'
alias ....='cd ../../..'

# auto directory pushd that you can get dirs list by cd -[tab]
#
setopt auto_pushd

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

## zsh editor
#
autoload zed

# 邪魔なrを潰す
disable r

## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

# exa

# alias ls="exa"
# alias la="exa -a"
# alias lf="exa -F"
# alias ll="exa -la"
# alias df="df -h"
# alias du="du -h"
# alias su="su -l"

# ghq
GHQ_ROOT="$HOME/go/src"
alias gcd='cd $(ghq root)/$(ghq list | peco)'

## OS configuration
### OS X

# brew用
# alias brewfix="sudo chown $(whoami):admin /usr/local && sudo chown -R $(whoami):admin /usr/local"
# alias where="command -v"
# export PATH="/usr/local/sbin:$PATH"
# export PATH="/usr/local/bin:$PATH"

# gvim
# export PATH="/Applications/MacVim.app/Contents/MacOS/:$PATH";

# Julia App
# alias julia="/Applications/Julia-1.5.app/Contents/Resources/julia/bin/julia"

# JUPYTER
# export BROWSER=open

# mono
# export MONO_GAC_PREFIX="/usr/local"

# export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
# export PATH="/usr/local/opt/openjdk/bin:$PATH"

## load user .zshrc configuration file
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine

## Others

export DISPLAY=:0
export LANG="ja_JP.UTF-8"
export GTK_IM_MODULE="uim"

# github
source ~/.github_token
# go
export PATH=$PATH:$HOME/go/bin

# SDKMAN
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/o108minmin/.sdkman"
[[ -s "/Users/o108minmin/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/o108minmin/.sdkman/bin/sdkman-init.sh"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
