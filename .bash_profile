#------------------------------------------------------------
#                WELCOME TO THE BASH PROFILE
#
#  ctrl+o followed by enter/return to save.
#  ctrl+x to exit.
#  activate changes by typeing 
#      source .bash_profile
#               or
#            srcprof   # (alias as defined below) 
#  at the prompt, or just exit terminal and open again.
#____________________________________________________________

#  add scripts to run at startup below...


#   change search directory for apps to Homebrew dir  
# ----------------------------------------------------------


#   bash completion
# ----------------------------------------------------------
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

# tmux completion
# ------------------------------------------------------------
eval "$(_TMUXP_COMPLETE=source tmuxp)"

# quicker commands
# ----------------------------------------------------------
alias c='clear'                                    # clear screen
alias sprof='vim .bash_profile'                    # show the bash profile
alias srcprof='source .bash_profile'               # reload the bash profile
alias boot='cd ~/projects/bootcamp/'               # go to bootcamp projects folder
alias tmx='tmux -CC'                               # start tmux session
alias tmxA='tmux -CC attach'                       # attach to existing tmux session
alias tmxL='tmux list-sessions'                    # list all tmux sessions
alias tmxAT='tmux -CC attach -t ' #<session-name>      # attach to a target session
alias tmxKT="tmux kill-session -t " #<session-name> # kill a target session
alias tmxKS="tmux kill-server"                      # appropriately kill all sessions
alias tmxKO="tmux kill-session -a"                  # when in session kill all OTHER sessions
alias tmxMDK='pkill -f tmux'                        # Murder Death Kill :p when outside tmux session kills all the tmux processes
alias tmxN='tmux new -s' #<new-sesh-name>           # create a new named session

# BOILERPLATE CODE FILES
alias newtern='cp ~/Desktop/code/boilerplates/configs/.tern-project .'      # copies the boilerplate tern file to current dir
alias newreactexpress='cp ~/Desktop/code/boilerplates/servers/reactexpress.js .' # copies the boilerplate reactexpress file
alias newplainhtml='cp ~/Desktop/code/boilerplates/html/plain-html.html .' # copies a very basic html file
alias newbshtml='cp ~/Desktop/code/boilerplates/html/bootstrap3-html.html .' # copies a plain html with bootstrap link included

# Projects | quick goto
#------------------------------------------------------------
alias caregap='boot && cd caregap'                  # go to care-gap directory
alias TMXcaregap='tmuxp load care-gap'              # load care-gap.yaml session

#-----------------------------------------------------------
# git aliases
alias gfu='git fetch upstream'                     #get upstream repo files
alias gmu='git merge upstream/master'              #sync up with upstream repo
alias gall='git add -A'                            #add all git files changes
alias gcm='git commit -m'                          #commit files and add message
alias gpom='git push origin master'  #push to the master repo 


# make BASH better
# ----------------------------------------------------------
# standard bash prompt 
# export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "

# my bash prompt
# export PS1="\[\033[36m\]\u:\[\033[33;1m\]\W/\[\033[m\]$ "

# Bash prompt with Git integration
function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "☺"
}
function parse_git_branch {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/[\1]/'
}
export PS1="\n\[\033[38;5;11m\]\u\[\033[38;5;15m\] on \[\033[38;5;112m\]\$(parse_git_branch)\[\033[38;5;15m\]\n└─\[\033[38;5;33m\]\W\[\033[38;5;15m\]/ ▶"

# function to change dir and list contents
function nav {
    builtin cd "$@" && 'ls' -ACd .*/ */ && find . -maxdepth 1 -type f -printf "%f\n" 
}


# custom colors and ls 

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -lGFhA'export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "





export PATH="/usr/local/sbin:/usr/local/bin:usr/sbin:$PATH"

export NVM_DIR="/Users/Daniel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
