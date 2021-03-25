export JAVA_HOME=$(/usr/libexec/java_home)
#eval "$(rbenv init -)"
#export VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.7/bin/python3
#source /Library/Frameworks/Python.framework/Versions/3.7/bin/virtualenvwrapper.sh
export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/bin/python3 '
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
#export VIRTUALENVWRAPPER_VIRTUALENV_ARGS=' -p /usr/local/bin/python3 '
export PROJECT_HOME=$HOME/repo
#source /usr/local/bin/virtualenvwrapper.sh
#export PATH="/usr/local/anaconda3/bin:$PATH"
export PATH=$PATH:/opt/Sencha/Cmd
export PATH=~/.npm-global/bin:$PATH
export PATH=~/npm/bin:$PATH
export PATH="/Applications/Firefox Developer Edition.app/Contents/MacOS":$PATH
#export PATH=$PATH:/new/dir1:/dir2:/dir/path/no3
export PYCURL_SSL_LIBRARY=openssl
export LDFLAGS=-L/usr/local/opt/openssl/lib;
export CPPFLAGS=-I/usr/local/opt/openssl/include;

# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/romanismailov/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#  git
  bundler
  dotenv
  osx
  rake
  rbenv
  ruby
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
 eval "$(rbenv init -)"

# plugins=(virtualenv)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time virtualenv) 
export VIRTUAL_ENV_DISABLE_PROMPT=yes

function virtenv_indicator {
    if [[ -z $VIRTUAL_ENV ]] then
        psvar[1]=''
    else
        psvar[1]=${VIRTUAL_ENV##*/}
    fi
}

add-zsh-hook precmd virtenv_indicator



export ORACLE_HOME=/Library/Oracle
export NLS_LANG=American_America.UTF8
export TNS_ADMIN=/Library/Oracle/instantclient_19_3/network/admin
export PATH=/Library/Oracle/instantclient_19_3:$PATH
export DYLD_LIBRARY_PATH=/Library/Oracle/instantclient_19_3:$DYLD_LIBRARY_PATH
export CLASSPATH=$ORACLE_HOME:$CLASSPATH




## Enable autocompletions
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi
zmodload -i zsh/complist
# Save history so we get auto suggestions
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
## Options
setopt auto_cd 
# cd by typing directory name if it
#s not a command
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances
setopt correct_all # autocorrect commands
setopt interactive_comments # allow comments in interactive shells
# Improve autocompletion style
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion
# Load antibody plugin manager
source <(antibody init)
# Plugins
antibody bundle zdharma/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
antibody bundle marzocchi/zsh-notify
antibody bundle buonomo/yarn-completion
## Keybindings
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char
bindkey '^[3;5~' delete-char
# Theme

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "
## Simplify prompt if we're using Hyper
if [[ "$TERM_PROGRAM" == "Hyper" ]]; then
  SPACESHIP_PROMPT_SEPARATE_LINE=false
  SPACESHIP_DIR_SHOW=false
  SPACESHIP_GIT_BRANCH_SHOW=false
fi
antibody bundle denysdovhan/spaceship-prompt
# Open new tabs in same directory
# BUG - two branch names in status bar - uchkur
#if [[ "$TERM_PROGRAM" == "Apple_Terminal" ]]; then
#  function chpwd {
#    printf 'e]7;%sa' "file://$HOSTNAME${PWD// /%20}"
#  }
#  chpwd
#fi
NPM_CONFIG_PREFIX=~/.npm-global
export PATH="/usr/local/sbin":$PATH
export PATH="/Users/romanismailov/tools":$PATH
export PATH="/Users/romanismailov/Downloads/mongodb-bi-osx-x86_64-v2.13.4/bin":$PATH
alias sql="${ORACLE_HOME}/sqlcl/bin/sql"
export CLASSPATH="/Users/romanismailov/tools":$CLASSPATH
#export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PATH="/usr/local/opt/python@3.7/bin:$PATH"
alias python=python3.7
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export GOPATH=~/repo/go
export PATH="$GOPATH/bin:$PATH"

export AIRFLOW_HOME=~/airflow
export AIRFLOW_CONN_ORA_PROD_DB="oracle://apl_stg:sberbank@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=0.0.0.0)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=aplcore)))"

#export PATH="$(/Users/romanismailov/Lab/olapy-viz/front/node_modules/.bin):$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
