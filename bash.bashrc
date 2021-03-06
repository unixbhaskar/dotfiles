# /etc/bash.bashrc for SuSE Linux
#
# PLEASE DO NOT CHANGE /etc/bash.bashrc There are chances that your changes
# will be lost during system upgrades.  Instead use /etc/bash.bashrc.local
# for your local settings, favourite global aliases, VISUAL and EDITOR
# variables, etc ...

#
# Check which shell is reading this file
#
if test -z "$is" ; then
 if test -f /proc/mounts ; then
  case "`/bin/ls --color=never -l /proc/$$/exe`" in
    */bash)	is=bash ;;
    */ash)	is=ash  ;;
    */ksh)	is=ksh  ;;
    */pdksh)	is=ksh  ;;
    */zsh)	is=zsh  ;;
    */*)	is=sh   ;;
  esac
  #
  # `r' in $- occurs *after* system files are parsed
  #
  for a in $SHELL ; do
    case "$a" in
      */r*sh)
        readonly restricted=true ;;
      -r*|-[!-]r*|-[!-][!-]r*)
        readonly restricted=true ;;
      --restricted)
        readonly restricted=true ;;
    esac
  done
 else
  is=sh
 fi
fi

#
# ksh/ash soemtimes do not know
#
test -z "$UID"  && readonly  UID=`id -ur 2> /dev/null`
test -z "$EUID" && readonly EUID=`id -u  2> /dev/null`

#
# Colored file listings
#
if test -x /usr/bin/dircolors ; then
    #
    # set up the color-ls environment variables:
    #
    if test -f $HOME/.dir_colors ; then
	eval "`/usr/bin/dircolors -b $HOME/.dir_colors`"
    elif test -f /etc/DIR_COLORS ; then
	eval "`/usr/bin/dircolors -b /etc/DIR_COLORS`"
    fi
fi

#
# ls color option depends on the terminal
# If LS_COLROS is set but empty, the terminal has no colors.
#
if test "${LS_COLORS+empty}" = "${LS_COLORS:+empty}" ; then
    LS_OPTIONS=--color=tty
else
    LS_OPTIONS=--color=none
fi
if test "$UID" = 0 ; then
    LS_OPTIONS="-A -N $LS_OPTIONS -T 0"
else
    LS_OPTIONS="-N $LS_OPTIONS -T 0"
fi

#
# Avoid trouble with Emacs shell mode
#
if test "$EMACS" = "t" ; then
    LS_OPTIONS='-N --color=none -T 0';
    tset -I -Q
    stty cooked pass8 dec nl -echo
fi
export LS_OPTIONS

#
# Set prompt and aliases to something useful for an interactive shell
#
case "$-" in
*i*)
    #
    # Some useful functions
    #
    if test -z "$restricted" ; then
	startx  () {
	    test -x /usr/bin/startx || {
		echo "No startx installed" 1>&2
		return 1;
	    }
		/usr/bin/startx ${1+"$@"} 2>&1 | tee $HOME/.xsession-errors
	}
	remount () { /bin/mount -o remount,${1+"$@"} ; }
    fi

    #
    # Set prompt to something useful
    #
    case "$is" in
    bash)
	# Force a reset of the readline library
	unset TERMCAP
	# Returns short path (last two directories)
	spwd () {
	  ( IFS=/
	    set $PWD
	    if test $# -le 3 ; then
		echo "$PWD"
	    else
		eval echo \"..\${$(($#-1))}/\${$#}\"
	    fi ) ; }
	# Set xterm prompt with short path (last 18 characters)
	ppwd () {
	    local _t="$1" _w _x _u="$USER" _h="$HOST"
	    test -n "$_t"    || return
	    test "${_t#tty}" = $_t && _t=pts/$_t
	    test -O /dev/$_t || return
	    _w="$(dirs +0)"
	    _x=$((${#_w}-18))
	    test ${#_w} -le 18 || _w="...${_w#$(printf "%.*s" $_x "$_w")}"
	    printf "\e]2;%s@%s:%s\007\e]1;%s\007" "$_u" "$_h" "$_w" "$_h" > /dev/$_t
	    }
	# If set: do not follow sym links
	# set -P
	#
	# Other prompting for root
	_t=""
	if test "$UID" -eq 0  ; then
	    _u="\[\e[31;1m\u@\e[33;1m\h_\e[35;1m\t_\e[36;1m\d\e[m\]"
	    _p=" #"
	else
	    _u="\[\e[32;1m\u@\e[33;1m\h_\e[35;1m\t_\e[36;1m\d\e[m\]"
	    _p=">"
	    if test \( "$TERM" = "xterm" -o "${TERM#screen}" != "$TERM" \) \
		    -a -z "$EMACS" -a -z "$MC_SID" -a -n "$DISPLAY"
	    then
		_t="\$(ppwd \l)"
	    fi
	    if test -n "$restricted" ; then
		_t=""
	    fi
	fi
	case "$(declare -p PS1 2> /dev/null)" in
	*-x*PS1=*)
	    ;;
	*)
	    # With full path on prompt
	    PS1="${_t}${_u}:\w${_p} "
#	    # With short path on prompt
#	    PS1="${_t}${_u}:\$(spwd)${_p} "
#	    # With physical path even if reached over sym link
#	    PS1="${_t}${_u}:\$(pwd -P)${_p} "
	    ;;
	esac
	# Colored root prompt (see bugzilla #144620)
	if test "$UID" -eq 0 -a -t && type -p tput > /dev/null 2>&1 ; then
	    _bred="$(tput bold 2> /dev/null; tput setaf 1 2> /dev/null)"
	    _sgr0="$(tput sgr0 2> /dev/null)"
	    PS1="\[$_bred\]$PS1\[$_sgr0\]"
	    unset _bred _sgr0
	fi
	unset _u _p _t
	;;
    ash)
	cd () {
	    local ret
	    command cd "$@"
	    ret=$?
	    PWD=$(pwd)
	    if test "$UID" = 0 ; then
		PS1="${HOST}:${PWD} # "
	    else
		PS1="${USER}@${HOST}:${PWD}> "
	    fi
	    return $ret
	}
	cd .
	;;
    ksh)
	# Some users of the ksh are not common with the usage of PS1.
	# This variable should not be exported, because normally only
	# interactive shells set this variable by default to ``$ ''.
	if test "${PS1-\$ }" = '$ ' ; then
	    if test "$UID" = 0 ; then
		PS1="${HOST}:"'${PWD}'" # "
	    else
		PS1="${USER}@${HOST}:"'${PWD}'"> "
	    fi
	fi
	;;
    zsh)
#	setopt chaselinks
	if test "$UID" = 0; then
	    PS1='%n@%m:%~ # '
	else
	    PS1='%n@%m:%~> '
	fi
	;;
    *)
#	PS1='\u:\w\$ '
	PS1='\h:\w\$ '
	;;
    esac
    PS2='> '

    if test "$is" = "ash" ; then
	# The ash shell does not have an alias builtin in
	# therefore we use functions here. This is a seperate
	# file because other shells may run into trouble
	# if they parse this even if they do not expand.
	test -s /etc/profile.d/alias.ash && . /etc/profile.d/alias.ash
    else
	unalias ls 2>/dev/null
        case "$is" in
	bash) alias ls='ls $LS_OPTIONS'		;;
	zsh)  alias ls='\ls $=LS_OPTIONS'	;;
	*)    alias ls='/bin/ls $LS_OPTIONS'	;;
	esac
	alias dir='ls -l'
	alias ll='ls -l'
	alias la='ls -la'
	alias l='ls -alF'
	alias ls-l='ls -l'

	#
	# Set some generic aliases
	#
	alias o='less'
	alias ..='cd ..'
	alias ...='cd ../..'
	alias cd..='cd ..'
	if test "$is" != "ksh" ; then
	    alias -- +='pushd .'
	    alias -- -='popd'
	fi
	alias rd=rmdir
	alias md='mkdir -p'
	if test "$is" = "bash" && ! type -p which > /dev/null 2>&1 ; then
	    #
	    # Other shells use the which command in path (e.g. ash) or
	    # their own builtin for the which command (e.g. ksh and zsh).
	    #
	    _which () {
		local file=$(type -p ${1+"$@"} 2>/dev/null)
		if test -n "$file" -a -x "$file"; then
		    echo "$file"
		    return 0
		fi
		hash -r
		type -P ${1+"$@"}
	    }
	    alias which=_which
	fi
	alias rehash='hash -r'
	alias you='su - -c "/sbin/yast2 online_update"'
	if test "$is" != "ksh" ; then
	    alias beep='echo -en "\007"'
	else
	    alias beep='echo -en "\x07"'
	fi
	alias unmount='echo "Error: Try the command: umount" 1>&2; false'
	test -s $HOME/.alias && . $HOME/.alias
    fi

    #
    # Expert mode: if we find $HOME/.bash.expert we skip our settings
    # used for interactive completion and read in the expert file.
    #
    if test "$is" = "bash" -a -r $HOME/.bash.expert ; then
	. $HOME/.bash.expert
    elif test "$is" = "bash" ; then
	# Complete builtin of the bash 2.0 and higher
	case "$BASH_VERSION" in
	[2-9].*)
	    if test -e $HOME/.bash_completion ; then
		. $HOME/.bash_completion
	    elif test -e /etc/bash_completion ; then
		. /etc/bash_completion
	    elif test -s /etc/profile.d/complete.bash ; then
		. /etc/profile.d/complete.bash
	    fi
	    for s in /etc/bash_completion.d/*.sh ; do
		test -r $s && . $s
	    done
	    ;;
	*)  ;;
	esac
    fi

    # Do not save dupes and lines starting by space in the bash history file
    HISTCONTROL=ignoreboth
    if test "$is" = "ksh" ; then
	# Use a ksh specific history file and enable
    	# emacs line editor
    	: ${HISTFILE=$HOME/.kshrc_history}
    	: ${VISUAL=emacs}
	case $(set -o) in
	*multiline*) set -o multiline
	esac
    fi
    ;;
esac

#
# Just in case the user excutes a command with ssh
#
if test -n "$SSH_CONNECTION" -a -z "$PROFILEREAD" ; then
    _SOURCED_FOR_SSH=true
    . /etc/profile > /dev/null 2>&1
    unset _SOURCED_FOR_SSH
fi

if test "$is" != "ash" ; then
    #
    # And now let's see if there is a local bash.bashrc
    # (for options defined by your sysadmin, not SuSE Linux)
    #
    test -s /etc/bash.bashrc.local && . /etc/bash.bashrc.local
fi

if test -n "$restricted" -a -z "$PROFILEREAD" ; then
    PATH=/usr/lib/restricted/bin
    export PATH
fi
#
# End of /etc/bash.bashrc
#
