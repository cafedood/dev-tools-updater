#!/bin/bash

#set -x

# set default dir
if [ $# -gt 0 ]; then
    BASE_DIR=$1
else
    BASE_DIR=~/dev/code
fi

# update git repo
cd $BASE_DIR
#echo "Default dir: " `pwd`

for i in $(find . -name ".git" | cut -c 3-); do
  cd $i/..;
  echo `pwd`
  git checkout master && git pull;
done

# update local dependencies
if type "brew" > /dev/null; then
  brew update && brew upgrade
fi

# update mac apps
if type "softwareupdate" > dev/null; then
  sudo softwareupdate --install --all
fi

