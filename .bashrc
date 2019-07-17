###############################################################################
## All purpose Bashrc file.
## cjohnson
## 20160629
###############################################################################
## Updated
# 20161010
# 20161101
# 20161205
# 20170523
# 20190610
# 20190716


# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Source External files
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# iTerm integration
#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# RASH startup
#eval "$(rash init)"

#########################
## History Settings-----
#########################

## History http://jesrui.sdf-eu.org/remember-all-your-bash-history-forever.html
#HISTTIMEFORMAT='%F %T '
#HISTFILESIZE=-1
#HISTSIZE=-1
#HISTCONTROL=ignoredups
#HISTIGNORE=?:??
## append to history, don't overwrite it
#shopt -s histappend
## attempt to save all lines of a multiple-line command in the same history entry
#shopt -s cmdhist
## save multi-line commands to the history with embedded newlines
#shopt -s lithist

# Configure history
# append to history, don't overwrite it
shopt -s histappend
# attempt to save all lines of a multiple-line command in the same history entry
shopt -s cmdhist
# save multi-line commands to the history with embedded newlines
shopt -s lithist

#######################
## Prompt Settings----
#######################
# Set prompt
# PS1=\[\\u@`hostname | sed 's/\.awarix\.com$//g'`\]\ \\!' '
# If id command returns zero, you have root access.
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1="\\[$(tput setaf 1)\\]\\u@\\h:\\w #\\[$(tput sgr0)\\]"
else # normal
  #PS1="\e[0;32m[\u@\h \W]\$ \e[m"
  #PS1="[\\u@\\h:\\w] $"
  #PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]"
  #PS1="\n\[\e[30;1m\](\[\e[34;1m\]\u@\h\[\e[30;1m\])-(\[\e[34;1m\]\t\[\e[30;1m\])\[\e[30;1m\]-(\[\e[32;1m\]\w\[\e[30;1m\])-(\[\e[32;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /usr/bin/sed 's: ::g') files, \$(/bin/ls -lah | /usr/bin/grep -m 1 total | /usr/bin/sed 's/total //')b\[\e[30;1m\])-> \[\e[0m\]\n"
   PS1="\n\[\e[30;1m\](\[\e[34;1m\]\u@\h\[\e[30;1m\])-(\[\e[34;1m\]\t\[\e[30;1m\])\[\e[30;1m\]-(\[\e[32;1m\]\w\[\e[30;1m\])-(\[\e[32;1m\]\$(/usr/bin/ls -1 | /usr/bin/wc -l | /usr/bin/sed 's: ::g') files, \$(/usr/bin/ls -lah | /usr/bin/grep -m 1 total | /usr/bin/sed 's/total //')b\[\e[30;1m\])-> \[\e[0m\]\n"
fi

# Append previous command to history, initial prompt_command
PROMPT_COMMAND='history -a'

## Eternal Bash History https://debian-administration.org/article/543/Bash_eternal_history
# The first line sets the format of history lines to include the date as a Unix timestamp,
# so you can now when you typed every command. The second line, which is the core of the
# solution, first ensures that, if a previous PROMPT_COMMAND was set, it gets executed
# before our stuff and then appends a line of the format:
#     PID USER INDEX TIMESTAMP COMMAND
# to a file called .bash_eternal_history in the current user home.
# export HISTTIMEFORMAT="%s "
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo $$ $USER \
               "$(history 1)" >> ~/.bash_eternal_history'

########################
## PATH Settings-------
########################

#PATHDIRS="/usr/local/bin /usr/local/sbin /Users/cjohnson/.local/bin /usr/local/opt/gettext/bin /opt/X11/bin"
# PATHDIRS="/bin /sbin /usr/bin /usr/sbin /usr/X11R6/bin /usr/local/bin /home/${USER}/bin"
#for DIR in ${PATHDIRS}; do
#    if ! echo "${PATH}" | grep -qw "${DIR}"; then
#        #echo Adding "${DIR}" to your path
#        PATH="${DIR}:${PATH}"
#    fi
#done
#unset PATHDIRS

# Ensure user-installed binaries take precedence
#export PATH="/Users/cjohnson/.local/bin:/usr/local/opt/atlassian:/usr/local/opt/gettext/bin:/opt/X11/bin:/Applications/LibreOffice.app/Contents:${PATH}"
#export NVM_DIR="/Users/cjohnson/.nvm"
#export PATH="$HOME/.npm-packages/bin:${PATH}"
#export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:${MANPATH}" # Homebrew Coreutils manpath
#export PATH="$(brew --prefix coreutils)/libexec/gnubin:${PATH}" # Homebrew Coreutils names
#export PATH="/usr/local:${PATH}" # Added to test Homebrew pathing
# A valid GOPATH is required to use the `go get` command.
# If $GOPATH is not specified, $HOME/go will be used by default:
# https://golang.org/doc/code.html#GOPATH

# You may wish to add the GOROOT-based install location to your PATH:
#export PATH=$PATH:/usr/local/opt/go/libexec/bin

################################
## MISC-------------------------
################################

#complete -C aws_completer aws
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#
# Colorcodes
#
NORMAL=$(echo -e "\e[0m")
RED=$(echo -e "\e[31m")
GREEN=$(echo -e "\e[0;32m")
LGREEN=$(echo -e "\e[1;32m")
BLUE=$(echo -e "\e[0;34m")
LBLUE=$(echo -e "\e[1;34m")
YELLOW=$(echo -e "\e[0;33m")

#
# command: ip
# highlight ip addresses, default route and interface names
#

IP4=${GREEN}
IP6=${LBLUE}
IFACE=${YELLOW}
DEFAULT_ROUTE={$LBLUE}

IP_CMD=$(which ip)

function colored_ip()
{
${IP_CMD} $@ | sed \
    -e "s/inet [^ ]\+ /${IP4}&${NORMAL}/g"\
    -e "s/inet6 [^ ]\+ /${IP6}&${NORMAL}/g"\
    -e "s/^default via .*$/${DEFAULT_ROUTE}&${NORMAL}/"\
    -e "s/^\([0-9]\+: \+\)\([^ \t]\+\)/\1${IFACE}\2${NORMAL}/"
}

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
cyan='\E[36;47m'
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue
BIPurple="\[\033[1;95m\]"     # Purple
BICyan="\[\033[1;96m\]"       # Cyan
BIWhite="\[\033[1;97m\]"      # White

# High Intensty backgrounds
On_IBlack="\[\033[0;100m\]"   # Black
On_IRed="\[\033[0;101m\]"     # Red
On_IGreen="\[\033[0;102m\]"   # Green
On_IYellow="\[\033[0;103m\]"  # Yellow
On_IBlue="\[\033[0;104m\]"    # Blue
On_IPurple="\[\033[10;95m\]"  # Purple
On_ICyan="\[\033[0;106m\]"    # Cyan
On_IWhite="\[\033[0;107m\]"   # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better
#
#export PS1=$IBlack$Time12h$Color_Off'$(git branch &>/dev/null;\
#if [ $? -eq 0 ]; then \
#  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
#  if [ "$?" -eq "0" ]; then \
#    # @4 - Clean repository - nothing to commit
#    echo "'$Green'"$(__git_ps1 " (%s)"); \
#  else \
#    # @5 - Changes to working tree
#    echo "'$IRed'"$(__git_ps1 " {%s}"); \
#  fi) '$BYellow$PathShort$Color_Off'\$ "; \
#else \
#  # @2 - Prompt when not in GIT repo
#  echo " '$Yellow$PathShort$Color_Off'\$ "; \
#fi)'

# source $HOME/.ssh/agent.sh
#export DISPLAY_MAC=`ifconfig en0 | grep "inet " | cut -d " " -f2`:0
# To enable Docker Version Manager
# [[ -s "$(brew --prefix dvm)/dvm.sh" ]] && source "$(brew --prefix dvm)/dvm.sh"
# To enable tab completion of commands, add the following command to your bash profile:
# [[ -s "$(brew --prefix dvm)/bash_completion" ]] && source "$(brew --prefix dvm)/bash_completion"


###############################
## Additional ENV exports------
###############################

# Load rbenv automatically by appending
# the following to ~/.bash_profile:

#eval "$(rbenv init -)"

# To make PIL available to Python we add its path to PYTHONPATH variable:
#PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
#PYTHONPATH=/usr/local/opt/python/libexec/bin:$PYTHONPATH
#export PYTHONPATH
#export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Setup JAVA_HOME
# set the Java version on Mac OS X (macOS) systems by
# exporting java_home. brew install tomcat-native

#export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

###################################
## Bash Completion for Alacritty --
###################################
#export PATH="$HOME/.cargo/bin:$PATH"
#if [ -f ~/.bash_completion_alacritty ]; then
#    source ~/.bash_completion_alacritty
#fi

# EOF
