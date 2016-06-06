#!/bin/bash

#set -x

# update git repo
update_git () {
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
# update local dependencies
if type "brew" > /dev/null; then
  brew update && brew upgrade
fi
}

update_mac () {
# update mac apps
if type "softwareupdate" > dev/null; then
  sudo softwareupdate --install --all
fi
# update apps out of app store

}


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
  update_git && update_brew && update_mac
fi

