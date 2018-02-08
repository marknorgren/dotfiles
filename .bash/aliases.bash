alias ..="cd .."

# quick edit aliases
alias reload="source ~/.bash/aliases.bash"
alias ea='$EDITOR ~/.bash/aliases.bash && reload'

function resque_workers() {
  if [ -z "$1" ]
  then
    echo "Enter the number of workers you want to run."
    return
  fi

  bundle exec rake QUEUE=* COUNT=$1 resque:workers
}

alias workers='resque_workers'
alias worker='resque_workers 1'

# use terminal mvim
alias vim='mvim -v'

# See disk usage in the current folder only
alias ds='du -h -d 1'

alias ll='ls -l'
alias cpwd='pwd | pbcopy' #copy working directory
alias cpdir=cpwd

#terminal
function title() {
  echo -n -e "\033]0;$1\007"
}

#Finder
alias o='open . &'

#Processes
alias tu='top -o cpu' # processes sorted by CPU
alias tm='top -o vsize' # processes sorted by Memory

# CocoaPods
alias pod-dev=$HOME/projects/CocoaPods/bin/pod

#Git
alias g='git status'
alias gb='git branch'
alias grc='git rebase --continue'
alias gpp='git pull --rebase && git push'
alias gmff='git merge --ff-only'
alias gpull='git pull origin master'
alias gpush='git push origin master'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gl='git log --oneline'

# Pretty-printing
alias format_json='python -m json.tool'

#create a new branch & switch to it
function gcb() {
  git checkout -b $*
}

#move to a branch
function gco() {
  git checkout $*
}

#commit pending changes and quote args
function gg() {
  git commit -v -a -m "$*"
}

alias gd='git diff'

function xc() {
  project_file=$(find -E . -maxdepth 2 -regex ".*\.(xcodeproj|xcworkspace)$" | \
    grep -v "xcodeproj/project.xcworkspace" | \
    grep -v Pods | \
    sort -r | \
    head -1)

  if [ -z "$project_file" ]
  then
    echo "Couldn't find a workspace or a project to open."
  else
    echo "Opening $project_file..."
    open $project_file -a /Applications/Xcode.app
  fi
}