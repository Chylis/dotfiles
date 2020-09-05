autoload -Uz compinit && compinit

# Load aliases
if [ -f ~/.zaliases ]; then
  source ~/.zaliases
fi

# FUZZY FINDER
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(z)

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
fpath=($fpath ~/.zsh/completion)

source <(kubectl completion zsh)
complete -F __start_kubectl k


# Source Swift completion
if [ -n "`which swift`" ]; then
#    eval "`swift package completion-tool generate-zsh-script`"
fi

## LOOK N' FEEL

#sets up the color scheme for list export
export LSCOLORS=ExFxBxDxCxegedabagacad

# set up the prompt color (currently a green similar to linux terminal)
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{82}(%b)%f'
zstyle ':vcs_info:*' enable git

# Left prompt
PROMPT='%(?.%F{82}√.%F{red}?%?)%f %B%F{87}%~%f%b $vcs_info_msg_0_ %# '

# Time of command in right prompt
RPROMPT='%*'


## PATHS AND SETTINGS
#Increase terminal history size file
HISTFILESIZE=1000000000 HISTSIZE=1000000

#Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# AWS
export AWS_PROFILE=mfa

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion