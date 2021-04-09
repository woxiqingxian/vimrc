# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/chanson/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="spaceship"
# ZSH_THEME="wedisagree"
# ZSH_THEME="bureau"
# ZSH_THEME="agnoster"
# ZSH_THEME="pygmalion"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-syntax-highlighting 
    # zsh-autosuggestions
    autojump
    zsh-proxychains-ng
    brew
    docker-compose
    docker
    # incr
    # go
    zsh-completions
    pyenv-lazy
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# 设置items2 的字符集
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# 快捷指令设置
alias ll='ls -al'
alias find_py='find ./ -name "*.py" | xargs grep -n  --color=auto '
alias find_html='find ./ -name "*.html" | xargs grep -n  --color=auto '
alias find_text='find ./ -type f | xargs grep -n  --color=auto '
alias find_js='find ./ -name "*.js*" | xargs grep -n  --color=auto '
alias find_vue='find ./ -name "*.vue*" | xargs grep -n  --color=auto '
alias find_lua='find ./ -name "*.lua*" | xargs grep -n  --color=auto '
alias find_go='find ./ -name "*.go*" | xargs grep -n  --color=auto '
alias find_php='find ./ -name "*.php*" | xargs grep -n  --color=auto '
# 请求dns缓存
alias clean_dns='sudo killall -HUP mDNSResponder; sleep 1; echo "macOS DNS Cache Reset"'
# 将rm命令改为移动到回收站
alias rm=trash
# 方便locate 命令和 updatedb
alias updatedb='sudo /usr/libexec/locate.updatedb'
# 编译构建go
alias go_build='docker run --rm -v "$GOPATH":/go -v "$PWD":/go/src/"${PWD##*/}" -w /go/src/"${PWD##*/}" -e GOOS="darwin" -e GOARCH="amd64" golang go build -v '
alias go_build_run='echo "------开始编译------\n";  docker run --rm -v "$GOPATH":/go -v "$PWD":/go/src/"${PWD##*/}" -w /go/src/"${PWD##*/}" -e GOOS="darwin" -e GOARCH="amd64" golang go build ; echo "------编译完成------\n"; ./"${PWD##*/}" '

# 命令行提示符
# PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p%{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}'
PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p%{$fg[cyan]%}%~ $(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}'
# PROMPT='%{$fg_bold[red]%}➜ %{$fg[cyan]%}%c $(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%}'


# 工具类 ===============================================
# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# FZF工具
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"

# 启用 kubectl 配置 shell 自动补全功能 
source <(kubectl completion zsh)

# 环境管理=========================================================

# HOMEBREW
# 源设置
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
# openssl 优先使用brew
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# curl 优先使用brew
export PATH="/usr/local/opt/curl/bin:$PATH"

# go 环境工具
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH
export CLASS_PATH=$JAVA_HOME/lib 

# Android-sdk
export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"
# export ANDROID_HOME="/usr/local/share/android-sdk"
export ANDROID_HOME="/usr/local/Caskroom/android-sdk/4333796"
# export PATH="/usr/local/Caskroom/android-platform-tools/29.0.1/platform-tools/"

# 使用异步插件启动，加载zsh速度
# # pyenc
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi
# eval "$(pyenv virtualenv-init -)"
