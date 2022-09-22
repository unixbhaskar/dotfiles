#!/usr/bin/env bash
# Author:  Bhaskar Chowdhury
# Email: unixbhaskar@gmail.com
# Website : https://github.com/unixbhaskar

# Check for existence of global bashrc
if [[ -e /etc/bashrc || -e /etc/bash.bashrc ]]; then

 source /etc/bashrc || source /etc/bash.bashrc

fi
# Bunch of exports
LESSOPEN="|/home/bhaskar/bin/lesspipe.sh %s"; export LESSOPEN
export PATH="$PATH:/home/bhaskar/bin"
#export PILOTRATE=115200
test -s ~/.alias && . ~/.alias || true
export HISTTIMEFORMAT="%h/%d/%Y - %H:%M:%S "
export HISTFILESIZE=99999
export  HISTSIZE=99999
export LS_COLORS='di=0;34:ex=1;32'
# Aliases
alias ls="ls --color=always"
alias grep="grep --color"
shopt -s checkwinsize cdspell autocd direxpand dirspell dotglob globstar histappend
alias mount="mount | column -t"
alias ports='netstat -tulanp'
alias fp="ps -ef | grep $1"
alias meminfo='free -m -l -t'
alias psmemhog='ps auxf | sort -nr -k 4'
alias pscpuhog='ps auxf | sort -nr -k 3'
alias fetch='wget -c'
alias rsync='rsync --progress --stats -ravz'
alias c="clear"
alias d='cd ~/Downloads'
alias p='cd ~/Pictures'
alias linuxgit='cd ~/git-linux/linux/'
alias boot='cd /boot'
alias music='cd ~/Music'
alias admscripts='cd ~/Adm_scripts'
alias docu='cd ~/Documents'
alias dstat='dstat -afv'
alias root="sudo su -"
alias sstatus="sudo systemctl status"
alias srestart="sudo systemctl restart"
alias diskinfo="df -h"
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias vpn_start='sudo /home/bhaskar/vpn_connect'
alias dmesg='sudo dmesg -H -T'
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
alias copy_to='sudo cp -v'
alias week='date +%V'
alias filepath='ls | sed "s:^:`pwd`/:"'
alias abspath='find $PWD -maxdepth 1 | xargs ls -ld'
alias i3configfiles="cd ~/.config/i3"
alias v="vim -u ~/.vimrc"
alias v1="vim -u ~/.vimrc_gruvbox"
alias sshot="cd ~/Pictures/Screenshots"
alias github_repo='/home/bhaskar/bin/github_repo'
alias see_log='sudo tail -f /var/log/messages || journalctl -f -q 2>/dev/null'
alias gitlog=gitlog
alias dmesg_err='sudo dmesg -H -T -l err'
alias ip='ip --color=auto'
alias journal_clear="sudo journalctl --vacuum-size=50000"
alias shortcut_pages="cd $HOME/shortcut/pages && ls | basename -s .md * | less"
alias githublinux="cd $HOME/git-linux/linux_github_fork"
alias githubgit="cd $HOME/git-linux/git_github_fork"
alias gcl=gclone
alias githubi3="cd $HOME/git-linux/i3"
alias update_buildroot="cd $HOME/git-linux/buildroot && git pull && cd ~"
alias docs-next-update="cd $HOME/git-linux/docs-next && git pull && cd ~"
alias calendar="/usr/local/bin/calcurse -C $HOME/.calcurse"
alias ulb="ls /usr/local/bin"
alias lbin="ls $HOME/bin"
alias h="history"
alias fastping="ping -c 10 -i.2 google.com"
alias kbuild_update="cd $HOME/git-linux/linux-kbuild && git pull && cd ~"
alias kbuild_source="cd $HOME/git-linux/linux-kbuild && tig"
alias docsnext_source="cd $HOME/git-linux/docs-next && tig"
alias buildroot_source="cd $HOME/git-linux/buildroot && tig"
alias linux_source="cd ~/git-linux/linux && tig"
alias linuxnet_source="cd $HOME/git-linux/linux-net && tig"
alias wiki="vim $HOME/vimwiki/index.md"
alias notification="$HOME/bin/notification > /dev/null 2>&1"
alias gitconfig="git config --global --edit"
alias vimrc="vim ~/.vimrc"
alias muttrc="vim ~/.muttrc"
alias reload_bashrc="source ~/.bashrc"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias cat="bat"
alias videodl="$HOME/bin/youtube-dl -f 18 $1"
alias mp3dl="$HOME/bin/youtube_video_to_mp3_conv.sh $1"
alias i3config="vim ~/.ithreeconfig"
alias nyxtconfig="vim ~/.nyxt_config.lisp"
alias linux-next="cd $HOME/git-linux/linux-next"
alias profile="vim ~/.profile"
alias i3blocks="vim ~/.ithreeblocksconfig"
alias scriptsgit="cd ~/git-linux/AdminScripts"
alias lt="cd ~/LaTeX_Workouts"
alias vimplugin=vimplugin
alias archlinux_update="cd $HOME/git-linux/ArchLinux_Kernel && git pull && cd ~"
alias gentoo_update="cd $HOME/git-linux/gentoo && git pull && cd ~"
alias slackware_update="cd ~/git-linux/SlackBuilds && git pull && cd ~"
alias debian_update="cd ~/git-linux/debian_linux && git pull && cd ~"
alias gdb="gdb --tui --quiet --statistics $1"
alias photo="sxiv $1"
alias vimpull="cd ~/git-linux/vim && git pull && cd ~"
alias screenrc="vim $HOME/screenrc"
alias vimb_config="vim ~/.config/vimb/config"
alias newsboat_config="vim ~/.newsboat/config"
alias feeds="$(command -v newsboat)"
alias style_vimb="vim ~/.config/vimb/style.css"
alias vim_plugin_list="grep  Plugin ~/.vimrc | grep -v '^\"'"
alias keybinds_i3="grep bindsym ~/.config/i3/config | grep -v ^# | less"
alias mpv="mpv --ytdl-format=best --no-audio-display"
alias menu="dmenufm -d -f -D -F -r $1"
alias vim_plugins_update="v +PluginUpdate +qa"
alias vim_plugins_install="v +PluginInstall +qa"
alias list_dir="ls -ad */"
alias systemd_running_services="command systemctl --no-page --no-legend --plain -t service --state=running"
alias which_arch="getconf LONG_BIT"
alias check_bad_sector="sudo badblocks -n -s -b 2048 $1"
alias aspell="aspell -d \"en_US.multi\" -c $1"
alias pdf_open="$(command -v zathura) $1"
alias mycalstart=mycalservice
alias mycalstatus="systemctl --user status mycal"
alias mycalrestart="systemctl --user restart mycal.timer && systemctl --user restart mycal.service"
alias user_daemon_reload="systemctl --user daemon-reload"
alias daemon_reload="sudo systemctl daemon-reload"
alias user_systemd_dir="cd ~/.local/share/systemd/user/"
alias mailsyncstart=mailsynclocally
alias mailsyncstatus="systemctl --user status mailsync"
alias mailsyncrestart="systemctl --user restart mailsync.timer && systemctl --user restart mailsync.service"
alias list_user_timers="systemctl --user list-timers --all"
alias list_system_timers="systemctl  list-timers --all"
alias keyboard_key_values="xmodmap -pke | less"
alias fix_spell="$HOME/git-linux/linux/scripts/checkpatch.pl -f --terse --nosummary --types=typo_spelling $1"
alias build=build
alias localmail="mutt -F $HOME/.muttrc.local"
alias enable_config="scripts/config --enable $1"
alias disable_config="scripts/config --disable $1"
alias who="git blame $1"
alias econfig="vim -O ~/.emacs ~/.orgemacs"
alias magit="vim -c MagitOnly"
alias tsm="transmission-remote"
alias tl="transmission-remote -l"
alias tsmadd="transmission-remote -a $1"
alias taskrc="vim ~/.taskrc"
alias taskopenrc="vim ~/.taskopenrc"
alias fetch_info="onefetch $1"
export MANPAGER="vim -R -c 'set ft=man nomod norelativenumber nonumber nolist' -M +MANPAGER -"
alias githome="cd $HOME/git-linux && ls"
alias newsboat_urls="vim /home/bhaskar/.newsboat/urls"
alias gitgraph="git log --all --decorate --oneline --graph"
alias i3edit="vim -O ~/.ithreeconfig ~/.orgithreeconfig"
alias edit-archives="vim -O ~/bin/archive ~/bin/extract_archive"
alias git_optimize="git reflog expire --all --expire=now; git gc --prune=now --aggressive"
alias vig="vim_with_gruvbox $1"
alias pkg_mask="vim /etc/portage/package.mask/$1"
alias pkg_unmask="vim /etc/portage/package.unmask/$1"
alias pkg_keyword="vim /etc/portage/package.accept_keywords"
alias pkg_use="vim /etc/portage/package.use/$1"
alias yt_video="vim ~/bin/my_yt_videos"
alias installpkg="sudo emerge -av $1"
alias removepkg="sudo emerge -ac $1"
alias g2="mutt -F /home/bhaskar/.muttrc.gmail2"
alias world="vim /var/lib/portage/world"
alias vih="vih $1"
# Check if the ssh-agent is already running
#if [[ "$(ps -u $USER | grep ssh-agent | wc -l)" -lt "1" ]]; then
#    #echo "$(date +%F@%T) - SSH-AGENT: Agent will be started"
#	# Start the ssh-agent and redirect the environment variables into a file
#    ssh-agent -s >~/.ssh/ssh-agent
#    # Load the environment variables from the file
#    . ~/.ssh/ssh-agent >/dev/null
#    # Add the default key to the ssh-agent
#    ssh-add ~/.ssh/id_rsa
#else
#    #echo "$(date +%F@%T) - SSH-AGENT: Agent already running"
#    . ~/.ssh/ssh-agent >/dev/null
#fi
#Intialize the terminal for gpg
unset SSH_AGENT_PID
GPG_TTY=$(tty)
export GPG_TTY
export PINENTRY_USER_DATA=USE_CURSES=1
unset SSH_ASKPASS
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null # help pgp find user tty for password prompts

gpg-reload(){
     pkill scdaemon
     pkill gpg-agent
     gpg-connect-agent /bye >/dev/null 2>&1
     gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
     gpgconf --reload gpg-agent
 }
#Gitlog

gitlog() {
  if [ "$1" ] && [ "$2" ]; then
	  git log --pretty=format:"%h%x09 %C(cyan)%an%x09 %Creset%ad%x09 %Cgreen%s" --date-order -n "$1" --author="$2"
 elif [ "$1" ]; then
   git log --pretty=format:"%h%x09 %C(cyan)%an%x09 %Creset%ad%x09 %Cgreen%s" --date-order -n "$1"
 else
    git log --pretty=format:"%h%x09 %C(cyan)%an%x09 %Creset%ad%x09 %Cgreen%s" --date-order
  fi
 }
# configure,make and make install combine in build call

build() {

	tm="/usr/bin/time -f"


	echo "Start the building .... $(date +'%T') on host $(uname -n)"
        echo

	if [  -f configure ]  && [  -x configure ]; then

            ${tm} "\n\n\tElapsed Time : %E \n\n" $PWD/configure

	fi

	if [ $? == 0 ]; then

		${tm} "\n\n\tElapsed Time : %E \n\n" make -j$(nproc)

	fi

	if [ $? == 0 ]; then

           ${tm} "\n\n\tElapsed Time : %E \n\n" sudo make install

          echo "Done"
     fi

}
# Generic search method including git repo specific search

search() {

       if [ ! -e .git ];then

		sudo find / -name "$1" -ls  2> /dev/null

	else
		git grep -n "$1"
	fi
}
# Git clone and get into the cloned directory

gclone() {

	 cd $HOME/git-linux && git clone "$1" &&  cd "$(basename $1 .git)"
}
# Emacs external package cloning
emacs_pkgs_clone() {

	 cd $HOME/.emacs.d && git clone "$1" &&  cd "$(basename $1 .git)"
}
# To clone vim plugin ~/.vim/bundle  dir

vimplugin() {
	 cd $HOME/.vim/bundle && git clone "$1" &&  cd "$(basename $1 .git)"
 }
# To kick of my calendar notification in systemd driven os

mycalservice() {
	init_system=$(/home/bhaskar/bin/find_init)
	if [[ $init_system  == "SYSTEMD" ]] && [[ $(pgrep X) != "" ]];then
	systemctl --user start mycal.timer
	systemctl --user start mycal.service
fi
}
# To start mail sync program aka mbsync

mailsynclocally() {
	init_system=$(/home/bhaskar/bin/find_init)
	if [[ $init_system  == "SYSTEMD" ]] && [[ $(pgrep X) != "" ]];then
	systemctl --user start  mailsync.timer
	systemctl --user start  mailsync.service
fi
}
# Wrap the following commands for interactive use to avoid accidental file overwrites.
rm() { command rm -i "${@}"; }
#cp() { command cp -i "${@}"; }
# mv() { command mv -i "${@}"; }
# Change the terminal prompt to git mode, very show but useful

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh
export GIT_DISCOVERY_ACROSS_FILESYSTEM=1
#create directory and enter into it

mkd() {
	mkdir -p "$@" && cd "$_";
}
#To show apt-history

function apt-history(){

      case "$1" in
        install)
              grep 'install ' /var/log/dpkg.log
              ;;
        upgrade|remove)
              grep $1 /var/log/dpkg.log
              ;;
        rollback)
              grep upgrade /var/log/dpkg.log | grep "$2" -A10000000 | grep "$3" -B10000000 | gawk '{print $4"="$5}'
              ;;
        *)
              cat /var/log/dpkg.log
              ;;
      esac
}
# Default terminal, browser and editor settings
export TERM=st-256color
export EDITOR=vim
export BROWSER="vimb"
# initialize fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#Open/copy/to_gitrepo files with the help fzf and vim

file_open() { vim "$(find  $(pwd) -type f | fzf)"  ;}
backup_dot_files() { cp -v "$1" "$(find /data/dotfiles -name '*' -type f | fzf)" ;}
copy_to_adminscripts_repo() { cp -v "$1" "$(find ~/git-linux/AdminScripts -name '*'  -type f | fzf)" ;}
#Gentoo specific stuff

alias eqf='equery f' #list all files installed by PKG
alias equ='equery u' #display USE flags for PKG
alias eqh='equery h' #list all packages that have USE flag
alias eqa='equery a' #list all packages for matching ENVIRONMENT data stored in /var/db/pkg
alias eqb='equery b' #list what package FILES belong to
alias eql='equery l' #list package matching PKG
alias eqd='equery d' #list all packages directly depending on ATOM
alias eqg='equery g' #display a tree of all dependencies for PKG
alias eqc='equery c' #list changelog entries for ATOM
alias eqk='equery k' #verify checksums and timestamps for PKG
alias eqm='equery m' #display metadata about PKG
alias eqy='equery y' #display keywords for specified PKG
alias eqs='equery s' #display total size of all files owned by PKG
alias eqw='equery w' #print full path to ebuild for PKG
#Shortcut to common kernel tool ,last_commited_hash,checkpatch,filehash et al

alias owner="/home/bhaskar/git-linux/linux/scripts/get_maintainer.pl $1"

last_commited_hash() {

      latest_hashval="$(gitlog | gawk '{ print $1 }' | head -1)"

      # echo This is the last committed hash : $latest_hashval

      echo $latest_hashval
}


checkpatch() {

	patch_check="/home/bhaskar/git-linux/linux/scripts/checkpatch.pl -g $(gitlog | gawk '{ print $1 }' | head -1)"

	$patch_check
}
filehash() {

	git ls-files -z  | GIT_PAGER= xargs -0 -L1 -I '{}' git log -n 1 --format="%h {}" -- '{}'

}
#Sane way to do sed with backup

sedwise() {

        if [[ $# -ne 2 ]];then

		echo Use like this: sedwise regexex filename
	else

		sed -i.$(date +'%F') $1 $2

		echo The original file is stored as $1.$(date +'%F')
	fi
	}
# Compare two files side by side

changes() {

	# if [ $# -ne 2 ];then
                # printf "Usage: changes filename_org filename_new \n"

	if [ -e .git ];then

		git diff

	else

               $(command -v vimdiff) $1 $2
	fi
}
# Discard changes in git repo
discard_changes() {

        if [[ $# -ne 1 ]];then

		printf "You need to provide the file name \n"

	else

		git checkout -- $1

	fi
}
# Find out the previous commit message
prev_commits_msgs() {

	if [[ $# -eq "" ]];then
		echo Please provide a filename to show previous commit messages.
	else

	filename=$1

	git log --oneline $filename | head -5

	fi
}
# git add and commit in one step
addcom() {

	git add .

	git ci "$@"  2> /dev/null

	if [[ "$@" == "" ]];then
		echo Not allowed empty commit msg...aborting
	fi
}
# Extract out the mail address from kernel maintainers file
get_email_addresses() {

	filename=$(git log -1 --name-only --oneline | grep /)
	scripts/get_maintainer.pl  $filename | tee $filename.$(date +'%T') 1> /dev/null
	extract_email_address $filename.* | paste -s -d, - > email_list
	rm -f $filename.*
}
# Filter out the subject pattern in the patch mail
subject_pattern() {

	filename=$(git log -1 --name-only --oneline | grep /)

	git log --oneline $filename | gawk '{ print $2" "$3 }' | head -5
}
# Send patch to the kernel mailing list semi-automated way
send_patch() {

	printf "\n Acquire those mail address attached with this file.....\n\n"

	get_email_addresses

	printf "\n\n THE PATCH FILE IS BELOW \n\n"

	git format-patch -1
	patchfile=$(basename *.patch)
	to="--to=$(cat email_list)"
	cc="--cc=linux-kernel@vger.kernel.org"
	an="--annotate"

	      printf "\n Checking values before sending the patch ....\n"
	      printf "\n ${patchfile}  ${to}  ${cc}\n"

	      printf "Is it look alright?? [Y/N] : %s"
	      read consent

         if [[ "$consent" == "N" ]];then
	      printf "\n\n  Patchfile and TO fields must be filled, it seems values are missing..so,aborting.\n"
         else
	      git send-email $patchfile ${to} ${cc} ${an}

	      printf "\nGetting rid of temp files....\n"
	      rm -f email_list
	      mv -v *.patch  ~/patches_sent/

	  fi
  }

# Kernel patch send reference documentations
#Ref: https://kernelnewbies.org/PatchSeries
#Ref2: https://kernelnewbies.org/PatchTipsAndTricks
# Send a patch series to the kernel mailing list
patch_series() {

	patch_dir="/home/bhaskar/git-linux/linux/batch"

	printf "\n\t Creating a patch series.....pls get the relevant email from MAINTAINERS file\n\n"

               printf "\n Mention comma separated maintainers email .... : %s"
               read man_email

	       to="--to=$(echo ${man_email} | paste -s -d, -)"
	       cc="--cc=linux-kernel@vger.kernel.org"
	       an="--annotate"

	printf "\n Pick the starting and ending commit for patch series range..\n"

	          git log --pretty=oneline --abbrev=committed | head -20


	 printf "\n Select the first commit of the series : %s"
	 read start_commit

	 printf "\n Now Select the end commit for the range : %s"
	 read end_commit

	 if [[ ! -d ${patch_dir} ]];then
		 mkdir -p ${patch_dir}
	 fi

        git format-patch -o ${patch_dir} --cover-letter -n --thread=shallow ${to} ${cc} ${start_commit}^..${end_commit}

	printf "\n\n Check the patch has been created properly or not....\n"

             find $patch_dir -type f -ls

	     printf "\n Is it looks alright?[Y/N]: %s"
	     read res

             if [[ $res == "N" ]];then

		     printf "\n Nope, it doesn't look good..aborting\n"
	     else

                    printf "\n Actually sending the patches ....\n\n"

                   git send-email --to-cover --cc-cover $patch_dir/*.patch ${an}
	     fi
}
# Take backup is simplest way with timestamp
backup() {
	cp -v "$1"{,.$(date +'%F_%T')}
}
# TaskWorrior Prompt

task_indicator() {

	URGENT=""
	DUETOMORROW=""
	OVERDUE=""

	TASK=$(command -v task)

	if [[ "$($TASK +READY +OVERDUE count)" -gt "0" ]]; then
		echo "$OVERDUE"
	elif [[ "$($TASK +READY +TOMORROW count)" -gt "0" ]]; then
		echo "$DUETOMORROW"
	elif [[ "$($TASK +READY urgency > 10 count)" -gt "0" ]]; then
		echo "$URGENT"
	else
		echo ""
	fi

}
# Prompt with a Taskwarrior task graph

PS1="\[\e[32;1m\u@\e[33;1m\h_\e[35;1m\t_\e[36;1m\d:\e[31;1m$(task_indicator)\e[m \]:\w>"

# Cscope DB

CSCOPE_DB=/home/bhaskar/git-linux/linux/cscope.out
export CSCOPE_DB

# Git log stats

gitstat() {

	if [[ -e .git ]];then
		git log --oneline --stat
	else
		echo not a git repo.
	fi
}
# Adding asdf
$HOME/git-linux/asdf/asdf.sh
$HOME/git-linux/asdf/completions/asdf.bash
# Emacs server daemon plus easy invocation of client
export ALTERNATE_EDITOR=''
alias ec='emacsclient --tty'
alias eg='emacsclient -c'
# Notes access
alias notes="vim ~/Notes/index.md"
# Bash debug
export PS4='# ${BASH_SOURCE}:${LINENO}: ${FUNCNAME[0]}() - [${SHLVL},${BASH_SUBSHELL},$?] '
 # LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
# export LS_COLORS
# Vgrep with fzf

vgrep() {

  INITIAL_QUERY=$1
  VGREP_PREFIX="vgrep --no-header"
FZF_DEFAULT_COMMAND="$VGREP_PREFIX '$INITIAL_QUERY'" fzf --bind "change:reload:$VGREP_PREFIX {q} || true" --ansi --phony --tac --query "$INITIAL_QUERY" | awk '{print $1}' | xargs -I{} -o vgrep --show {}
}
