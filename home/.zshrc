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

#-- Other
alias sn="shutdown now"
alias open="xdg-open"
alias vg="valgrind --leak-check=full --track-origins=yes"
alias mhfu="sudo ufw disable && sudo openvpn --config $HOME/Trevor-1529553951__HVMAIN.ovpn && sudo ufw enable"

#-- Config Vars
export EDITOR='nvim'
if [ -d "$HOME/.local/bin" ] ;
	then PATH="$PATH:$HOME/.local/bin"
fi

#-- Nvim
alias nv="nvim"
alias nv.="nvim ."

#-- Git
alias grall='git restore .'
alias gd='git diff .'
alias gdc='git diff --staged .'
alias gau='git add -u'
alias gs='git status -s'
alias gpo='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias glp='git log --patch'
alias glr='git log --raw'

#-- Power Management (only my laptop)
#-- Check sudo cpupower frequency-info
power(){
	PS3='Select a power mode: '
	select opt in "performance" "normal" "save batery" "quit"; do
		case $opt in
			"performance")
				sudo cpupower frequency-set -g performance -d 4.0G -u 4.37G
				break
				;;
			"normal")
				sudo cpupower frequency-set -g powersave -d 0.4G -u 4.37G
				break
				;;
			"save batery")
				sudo cpupower frequency-set -g powersave -d 0.7G -u 1G
				break
				;;
			"quit")
				break
				;;
			*)
				echo "Invalid option $REPLY"
		esac
	done
}

#-- Docker
alias docker='sudo docker' # Just let me run the command!

#-- Fzf
export repo_folder="$HOME/Repos"

#-- This is heavily inspired by thePrimeagen tmux-sessionizer
#-- So I tried to call this from inside nvim but couldn't find it so
#-- IF in the future I want to start using this in that way I would need to
#-- create is own file and add it to the PATH
fzfChange(){
	project_name=$(ls ${repo_folder} | fzf )

	if [[ -z $project_name ]]; then
		return 1
	fi

	if [[ -z ${TMUX} ]]; then
		tmux new -As $project_name -c "$repo_folder/$project_name"
		return 0
	fi

	if ! tmux has-session -t=$project_name 2> /dev/null ; then
		tmux new-session -ds $project_name -c "$repo_folder/$project_name"
	fi
		tmux switch-client -t $project_name
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

GitMagic(){
	separation="============"
	echo "Starting auto fixup!"
	echo $separation

	maxCommits=0
	counter=0
	commitNumber=""
	log_output=""

	log_output=$(git --no-pager log --format=oneline -10)

	while IFS= read -r line; do
	echo "($counter) $line"
	((counter+=1))
	done <<< "$log_output"

	echo $separation

	if [ "$0" = "bash" ]; then
	# Why std error?
	read -p "Which commit do you want?: " commitNumber 
	else
	vared -p "Which commit do you want?: " -c commitNumber 
	fi

	selectedCommit=$(git --no-pager log --format=oneline --skip=$commitNumber -1 | awk '{print $1}')

	if git commit --fixup=${selectedCommit} 2>&1 1>/dev/null; then
		echo "Everything went well, rebasing..."
	else
		echo "Finished with issue, have you added files to git?"
		return 1
	fi

	totalCommits=$(git rev-list --count HEAD) # Will this work for branches?
	if (( "$totalCommits" >= 4 )); then
		git rebase -i --autosquash HEAD~3
	else
		git rebase -i --autosquash --root
	fi
}

bindkey -s ^F "fzfChange\n"
bindkey -s ^G "fzfGit\n"
bindkey -s ^T "GitMagic\n"

#-- Python
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
alias penv="python -m venv .venv && . .venv/bin/activate"


#-- Add foundryVTT to PATH
export PATH="$PATH:$HOME/Foundry"

#-- Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

#-- For tmux colors
export TERM='xterm-256color'
export VISUAL='nvim'

#-- Why do you hate me dmenu?
#-- This is only because dmenu can't always open flatpak apps
alias ob='flatpak run md.obsidian.Obsidian&'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/leo/Downloads/gcloud/google-cloud-sdk/path.zsh.inc' ]; then . '/home/leo/Downloads/gcloud/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/leo/Downloads/gcloud/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/leo/Downloads/gcloud/google-cloud-sdk/completion.zsh.inc'; fi
