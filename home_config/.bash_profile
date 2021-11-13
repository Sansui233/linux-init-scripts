export PATH=$PATH:/usr/local/go/bin

# Oh-my-bash
export OSH=/root/.oh-my-bash
OSH_THEME="agnoster"
DISABLE_AUTO_UPDATE="true"
completions=(
  git
  composer
  ssh
)
plugins=(
  git
  bashmarks
)
source $OSH/oh-my-bash.sh

# SSH settings
# enables color in the terminal bash shell
export CLICOLOR=1
# sets up the color scheme for list
export LSCOLORS=ExFxCxDxBxegedabagacad
# enables color for iTerm
export TERM=xterm-color
export TERM="xterm-color"
PS1='\[\e[0;33m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ '
# sets up proper alias commands when called
alias ls='ls --color -vG'
alias ll='ls -al'
alias la='ls -a'
alias vi='vim'

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh

alias sudo='sudo env PATH=$PATH'