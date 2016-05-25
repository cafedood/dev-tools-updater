#!/bin/bash

set -x

# update git repos
BASE_DIR=~/dev/code
cd $BASE_DIR
for i in $(find . -name ".git" | cut -c 3-); do
  cd $i;
  git checkout master && git pull;
  cd $BASE_DIR;
done

# update local dependencies
if type "brew" > /dev/null; then
  brew update && brew upgrade
fi

