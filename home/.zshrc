if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#-- Oh my zsh
export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename '/home/leo/.zshrc'

autoload -Uz compinit
compinit

#-- P10k installed manually
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#-- EXA
alias ls="exa"
alias ll="exa -l"
alias la="exa -la"

#-- Other
alias latamk="sudo localctl set-x11-keymap latam"
alias sn="shutdown now"
alias zt="sudo systemctl start zerotier-one.service"

#-- Config Vars
export EDITOR='nvim'
if [ -d "$HOME/.local/bin" ] ;
	then PATH="$PATH:$HOME/.local/bin"
fi

#-- Nvim
alias nv="nvim"
alias nvz="nvim ~/.zshrc"
alias nvc="nvim ~/.config/nvim/"

#-- Git
alias grall='git restore .'
alias gd='git diff .'
alias gdc='git diff --staged .'
alias gau='git add -u'
alias gs='git status -s'
alias gcom='git commit -m'
alias gcmp='git checkout main && git pull' #TODO: Check if master exist and use that instead
alias gpo='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias glp='git log --patch'
alias glr='git log --raw'

#-- Power Management (only my laptop)
alias performance='sudo cpupower frequency-set -g performance -d 4.0G -u 4.3G'
alias powersave='sudo cpupower frequency-set -g powersave -d 0.7G -u 1G'

#-- DotFiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#-- Fzf
export repo_folder="$HOME/Repos"
alias gfzf="git branch | fzf-tmux -d 15 | xargs git checkout"

#-- This is heavily inspired by thePrimeagen tmux-sessionizer
#-- So I tried to call this from inside nvim but couldn't find it so
#-- IF in the future I want to start using this in that way I would need to
#-- create is own file and add it to the PATH
fzfChange(){
    proyect_name=$(ls ${repo_folder} | fzf )
    if [ -z ${TMUX} ]; then
		tmux new -As $proyect_name -c "$repo_folder/$proyect_name"
        exit 0
    fi

    if ! tmux has-session -t=$proyect_name 2> /dev/null ; then
		tmux new-session -ds $proyect_name -c "$repo_folder/$proyect_name"
	fi
    tmux switch-client -t $proyect_name
}

fzfGit(){
    folder=$(pwd)
    if [[ $folder == *"worktree"* ]]; then
        branch=$(git worktree list | awk '{print $1}' | fzf)
	cd $branch
    else
        branch=$(git branch | fzf)
	branch_clean=${branch/"*"}
	branch_clean=$(echo "$branch_clean" | xargs )
	git checkout $branch_clean 2>/dev/null
    fi
}

bindkey -s ^F "fzfChange\n"
bindkey -s ^G "fzfGit\n"

#-- Add foundryVTT to PATH
export PATH="$PATH:$HOME/Foundry"

#-- Rust
source "$HOME/.cargo/env"
