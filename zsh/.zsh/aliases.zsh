# aliases
alias ll="ls -lahF --color=auto"
alias ls="ls -hF --color=auto"
alias lsl="ls -lhF --color=auto"
alias grep="grep --color=auto"
alias ".."="cd ../"
alias rmrf="rm -rf"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias e="emacs"
alias v="emacs"
alias vi="emacs"
alias ga="git add"
alias gc="git commit -S -m"
alias gs="git status"
alias gd="git diff"
alias gf="git fetch"
alias gm="git merge"
alias gr="git rebase"
alias gp="git push"
alias gu="git unstage"
alias gg="git graph"
alias gco="git checkout"
alias term="urxvtc -hold -e " #used for run menu
alias update="pacaur -Syu"

#configuration files
alias EMACS_CFG="emacs /home/raiden00/git/dotfiles/emacs/.emacs.d/init.el"
alias ZSH_CFG="emacs /home/raiden00/git/dotfiles/zsh/.zshrc"
alias URXVT_CFG="emacs /home/raiden00/git/dotfiles/urxvt/.Xresources"
alias AWESOME_CFG="emacs /home/raiden00/git/dotfiles/awesome/rc.lua"

alias HDMIONLY="xrandr --output LVDS --off --output HDMI-0 --auto"
alias LVDSONLY="xrandr --output LVDS --auto --output HDMI-0 --off"
alias XRANDR_CFG="xrandr --output HDMI-0 --auto --output LVDS --below HDMI-0"

# projects
alias PROJECTS_DIR="cd $HOME/projects"
alias GIT_DIR="cd $HOME/git"
alias TOOLS_DIR="cd $HOME/tools"
alias MYGTD="emacs '/media/veracrypt1/mygtd.org'"

alias DIGITALOCEAN_ROOT="ssh root@104.131.31.249"
alias DIGITALOCEAN="ssh raiden00@104.131.31.249"
