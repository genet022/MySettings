# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi



# Source global definitions
if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
else
        . /etc/bash_completion.d/git
        . /etc/bash_completion.d/subversion
fi

if [ -f ~/.terminal_colors ]; then
        . ~/.terminal_colors
fi

# User specific aliases and functions

set_bash_prompt() {
        PROMPT="[$GREEN\u$END_COLOR@$RED\h$END_COLOR $CYAN\w$END_COLOR]"
        if is_git_repository; then
                PROMPT="$PROMPT $YELLOW($(git_branch))$END_COLOR\n"
        fi

        export PS1="$PROMPT\# "
}
function is_git_repository {
        git branch > /dev/null 2>&1
}
git_branch()
{
        if ! git rev-parse --git-dir > /dev/null 2>&1; then
                return 0
        fi

        echo $(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
}
PROMPT_COMMAND=set_bash_prompt



# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

alias ll='ls -l'
alias xterm='xterm -geometry 93x31+1000+50'
alias clean='./sim/scripts/simsweep.pl && ./scar -cleanup'

alias i='ssh -XC ironside.ftc.rdlabs.hpecorp.net'
alias s='ssh -XC snap.ftc.rdlabs.hpecorp.net'

