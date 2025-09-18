
### Zinit
source ~/.local/share/zinit/zinit.git/zinit.zsh

#autoload -Uz _zinit
#(( ${+_comps} )) && _comps[zinit]=_zinit

PS1="READY >" # provide a simple prompt till the theme loads

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

### ZSH
HISTSIZE=10000
SAVEHIST=10000
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME

# Partial name completion
zstyle ':completion:*' completer _complete
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'

zinit wait lucid for \
    atinit"zicompinit; zicdreplay"  \
    zdharma-continuum/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions \
    z-shell/zsh-navigation-tools \
    MichaelAquilina/zsh-you-should-use \
    zsh-users/zsh-completions

zinit wait lucid for \
    OMZL::git.zsh \
    OMZP::git \
    OMZP::git-auto-fetch \
    OMZP::magic-enter \
    OMZP::brew

zinit from"gh-r" as"program" mv"direnv* -> direnv" \
    atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
    pick"direnv" src="zhook.zsh" for \
        direnv/direnv

#zinit snippet OMZP::docker/_docker
#zi snippet https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/docker-compose/_docker-compose
#zi snippet OMZP::docker-compose/_docker-compose

#export NVM_LAZY_LOAD=true
#export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim')
#zinit light lukechilds/zsh-nvm

# Theme
# Load starship theme
# line 1: `starship` binary as command, from github release
# line 2: starship setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugin configuration
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1
YSU_MESSAGE_POSITION="after"
MAGIC_ENTER_GIT_COMMAND='gst .'
MAGIC_ENTER_OTHER_COMMAND='ls -lh .'


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export CPATH="/opt/homebrew/include"
export LIBRARY_PATH="/opt/homebrew/lib"

# Colorize less
# Requires pygments
#export LESS='-R'
#export LESSOPEN='|pygmentize -g %s'

# Colorize ls
export CLICOLOR=1

# Personal aliases
alias ls='ls -F'
alias ll='ls -l'
alias la='ls -la'

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# pyenv
#eval "$(pyenv init --path)"

# Poetry
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi

export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true

# Java
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-17.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-21.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/graalvm-ce-java17-22.1.0/Contents/Home"

#export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-21.1.0/Contents/Home
export GRAALVM_HOME="/Library/Java/JavaVirtualMachines/graalvm-ce-java17-22.1.0/Contents/Home"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/opt/homebrew/Caskroom/mambaforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh" ]; then
#        . "/opt/homebrew/Caskroom/mambaforge/base/etc/profile.d/conda.sh"
#    else
#        export PATH="/opt/homebrew/Caskroom/mambaforge/base/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

export PATH="/usr/local/sbin:$PATH"

#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi

#if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

[ -f "/Users/jens/.ghcup/env" ] && source "/Users/jens/.ghcup/env" # ghcup-env
export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PYTHONUSERBASE=~/.local
export PATH="$PATH:$PYTHONUSERBASE/bin"

# Docker Desktop
export PATH=$PATH:~/.docker/bin

#export MAVEN_OPTS='--add-opens java.base/java.lang=ALL-UNNAMED'

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="/opt/homebrew/lib/ruby/gems/3.2.0/bin:$PATH"

# fnm
export PATH="/Users/jensh/Library/Application Support/fnm:$PATH"
eval "$(fnm env --shell zsh)"

# Android sdk
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
