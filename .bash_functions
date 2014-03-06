source ~/.bash_colors
function settitle { 
  echo -ne "\e]2;$@\a\e]1;$@\a"; 
}

function set_colorf {
    tput setaf $1
    exit
    local retcolor="\e["
    for var in "$@"
    do
	retcolor="${retcolor}$var;"
    done
    retcolor="${retcolor:0:${#retcolor}-1}m"
    echo -e $retcolor
}

function set_colorb {
    tput setab $1
}

function set_bold {
    tput bold
}

function set_underline {
    if [ $1 -eq 1 ]; then
        tput smul;
    else
        tput rmul;
    fi
}

function set_blink {
    echo -en "\e[5m"
}

function reset {
    tput sgr0
}

function getclient {
    if [[ $SSH_CLIENT == "" ]]; then
        echo $(hostname -i);
    else
        echo $(echo $SSH_CLIENT | cut -d ' ' -f 1);
    fi
}

function getjobs {
    echo $(jobs | wc -l)
}

function formatjobs {
    if [[ $(getjobs $1) == 0 ]] ; then
	set_colorf $green;
        return 2
    else
	if [[ $(getjobs $1) > 2 ]] ; then
            set_blink;
	    set_colorf $red;
	else
	    set_colorf $red;
	fi
    fi
}

function formatreturn {
    if [[ $1 == 0 ]]; then
        set_bold;
        set_colorf $green;
    else
        set_bold;
        set_colorf $red;
    fi
}

function check_git {
    if [[ $(__git_ps1 %s) != "" ]]; then
        echo -e "\0342\0224\0200\0342\0224\0200$(set_colorf $green)[$(__git_ps1 %s)]$(reset)"
    fi
}

function quota_check {
    quota &> /dev/null
    if [ $? -ne 0 ]; then
        echo \*;
    fi
}

function format_venv {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        echo -e "\0342\0224\0200\0342\0224\0200$(set_colorf $green)[$(basename $VIRTUAL_ENV)]$(reset)"
    fi
}
