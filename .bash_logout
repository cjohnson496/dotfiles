# Sample .bash_logout
# Redone by Charles Johnson
# This file is executed by bash(1) when login shell exits.

# ~/.bash_logout

# Clear all SSH Keys when logging out
/usr/bin/keychain --clear

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear ] && /usr/bin/clear
fi

# Check the $GIT_SAVE_OFF var before exit.
if [ ! "$GIT_SAVE_OFF" = "true" ]; then
  cd ~
  dots checkout master
  dots commit -a -m "DOTS-XXX: bash_logout commit $(date)"
  dots push origin master
fi

# EOF
