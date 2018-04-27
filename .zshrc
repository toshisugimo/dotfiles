PROMPT="%F{green}%~ %f
[%n]$ "

 autoload -Uz vcs_info
 setopt prompt_subst
 zstyle ':vcs_info:git:*' check-for-changes true
 zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
 zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
 zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
 zstyle ':vcs_info:*' actionformats '[%b|%a]'
 precmd () { vcs_info }
 RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

 export ZPLUG_HOME=/usr/local/opt/zplug
 source $ZPLUG_HOME/init.zsh

 zplug "zsh-users/zsh-autosuggestions"
 zplug "zsh-users/zsh-completions"
