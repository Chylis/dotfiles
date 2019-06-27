## LOOK N' FEEL

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#enables color in the terminal bash shell export
export CLICOLOR=1

#sets up the color scheme for list export
export LSCOLORS=ExFxBxDxCxegedabagacad

#set up personal github api token
export HOMEBREW_GITHUB_API_TOKEN=b794ab98a797d5b2e7672afa589d48d4b9550903

# Git branch in prompt.
_parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

#sets up the prompt color (currently a green similar to linux terminal)
export PS1="\[\033[0;95m\]\t\[\033[00m\] \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[32m\]\$(_parse_git_branch)\[\033[00m\] $ "

#enables color for iTerm
export TERM=xterm-color

#load aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi


#Git autocomplete
source ~/git-completion.bash

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#Ant completion
complete -C /opt/local/share/java/apache-ant/bin/complete-ant-cmd.pl ant build.sh

## PATHS AND SETTINGS
#Increase terminal history size file
HISTFILESIZE=1000000000 HISTSIZE=1000000

##iOS mobile device logging program http://dev.man-online.org/man1/idevicesyslog/
#DYLD_LIBRARY_PATH=/Users/magnuse/MagApps/imobiledevice-macosx/:$DYLD_LIBRARY_PATH
#PATH=$PATH:/Users/magnuse/MagApps/imobiledevice-macosx/

#Setting for the new UTF-8 terminal support in Lion
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

##screen irssi, /connect irc.freenode.net 8001, /join #dsv

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
