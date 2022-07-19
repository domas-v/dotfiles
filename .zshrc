# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PYTHONBREAKPOINT=ipdb.set_trace
export SHARED="$HOME/Work/shared/"
export TRASH="$HOME/.local/share/Trash"
export PATH=$HOME/.config/rofi/bin:$PATH
export GIT_PAGER=delta

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-interactive-cd
    archlinux
    python
    pip
    ripgrep
    fd
    docker
    fzf
    aliases
    rust
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# aliases
alias open="xdg-open"
alias i="kitty +kitten icat"
alias s="kitty +kitten ssh"
alias b="bat"

# ssh
alias bmdgpu="kitty +kitten ssh dvaitmonas@192.168.1.1"
alias bmdcpu="kitty +kitten ssh dvaitmonas@192.168.1.2"
alias fsgpu="sshfs -p 6811 -o allow_other,IdentityFile=~/.ssh/id_rsa dvaitmonas@88.119.50.105:/home/dvaitmonas ~/Work/gpu-server -oauto_cache,reconnect"
alias fscpu="sshfs -p 6812 -o allow_other,IdentityFile=~/.ssh/id_rsa dvaitmonas@88.119.50.105:/home/dvaitmonas ~/Work/cpu-server -oauto_cache,reconnect"
alias fsshared="sshfs -o allow_other,IdentityFile=~/.ssh/id_rsa dvaitmonas@192.168.1.1:/mnt/shared ~/Work/shared"

# config management
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no
alias confst="config status"
alias confdiff="config diff"
alias confdiffs="config diff --staged"
alias confc="config commit -m"
alias confp="config push"
alias confa="config add"

# neovim
alias n="nvim"
alias ng="nvim -c 'Neogit'"
alias src="source ~/.zshrc"
alias zshrc="nvim ~/.zshrc"
alias nrc="nvim ~/.config/nvim/init.lua"
alias kitrc="nvim ~/.config/kitty/kitty.conf"
alias i3rc="nvim ~/.config/i3/config"

# python
alias pyvenv="source ~/py/bin/activate"
alias dd="deactivate"
alias ipy="ipython"

# fzf
alias fzp="pip freeze | fzf"
alias fzh="history | fzf"

# conda
alias cab="conda activate base"
alias cdd="conda deactivate"
alias crm="conda env remove -n"
alias cce="conda env create -f environment.yml"
alias cls="conda env list"

activate_conda_env() {
    setopt local_options BASH_REMATCH
    line=$(grep "name:" "environment.yml")
    regex="\:\s([a-z-]+)"
    if [[ $line =~ $regex ]]; then
        if [[ -n ${BASH_REMATCH[2]} ]]; then
            conda activate "${BASH_REMATCH[2]}"
        fi
    fi
}

ca() {
    if [ -n "$1" ]; then
        conda activate $1
    else
        if [[ -f "environment.yml" ]]; then
            activate_conda_env
        else
            echo "No environment present in this folder."
            echo "Use one of $(cls)"
        fi
    fi
}

cd() {
    builtin cd $1
    if [[ -f "environment.yml" ]]; then
        activate_conda_env
    fi
}

# exa
alias ls="exa --git"
alias l="exa -la --git"
alias ll="exa -l --git"
alias lg="exa -G --git"
alias lG="exa -aG --git"
alias lt="exa -lT --git"
alias lT="exa -laT --git"
alias lD="exa -laD --git"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/domas/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/domas/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/domas/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/domas/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

