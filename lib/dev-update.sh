#!/bin/bash
# set -x  debugging switch

# update all git repos in folders on your machine
update_git ( ) { 
  cd $BASE_DIR
  echo "Default dir: " `pwd`
  
  for i in $(find . -name ".git" | cut -c 3-); do
    cd $i/..;
    echo `pwd`
    git checkout master && git pull;
    cd $BASE_DIR
  done
}

 
update_brew () {    
# update brew installations
if type "brew" > /dev/null; then
  brew update && brew upgrade
fi
}   

update_mac () {
# update mac apps
if type "softwareupdate" > /dev/null; then
  sudo softwareupdate --install --all
fi
# update apps not from app store, not finished

}

#hookup_fun () {
# 
# 
#}

#log_console () {
#
#}
 
# set default dir
if [ $# -gt 0 ]; then
  if [ $1 = 'git' ]; then
    if [ ! -z $2 ]; then
      BASE_DIR=$2
    fi
    update_git
  elif [ $1 = 'brew' ]; then
    update_brew
  elif [ $1 = 'mac' ]; then
    update_mac
  fi
else
  BASE_DIR=~/dev/code
  update_git && update_brew #&& update_mac
fi
