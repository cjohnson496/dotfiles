# ~/.bash_logout
# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear ] && /usr/bin/clear
fi
if [ ! "$GIT_SAVE_OFF" = "true" ]; then
  cd ~
  dots checkout master
  dots commit -a -m "DOTS-XXX: bash_logout commit $(date)"
  dots push origin master
fi

# EOF
