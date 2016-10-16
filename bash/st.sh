#!/bin/bash
. $HOME/bin/prompt.sh
st() {
  usage() {
    echo ""
    echo "Performs 'git status' on all subfolders that are valid git repositories."
    echo ""
    echo "  st [options]"
    echo ""
    echo "Options:"
    echo "   -h, -?  Show this help."
    echo "   -p      Indicates whether to prompt before each action for each git repository."
    echo ""
  }
  prompt=0
  local OPTIND
  while getopts "h?p" opt; do
    case "$opt" in
      p)
        prompt=1
        ;;
      h|\?)
        usage
        return
        ;;
    esac
  done
  shift $((OPTIND-1))
  basedir=`eval pwd`
  basedirLength=${#basedir}
  if ! test -d "$basedir"; then
    echo "Folder does not exist"
    return
  fi
  if test -d "$basedir/.git"; then
    prompt result
    if [ "$result" == y ]; then
      git status
    fi
    return
  fi
  pushd "$basedir" &> /dev/null
  for dir in "$basedir"/*; do
    if test -d "$dir/.git"; then
      echo ""
      echo -e "\e[36m PROCESSING \e[30;48;5;43m ${dir:$basedirLength} \e[0m"
      prompt result
      if [ "$result" == q ]; then
        popd &> /dev/null
        return
      fi
      if [ "$result" == y ]; then
        cd "$dir"
        git status
      fi
    fi
  done
  echo ""
  popd &> /dev/null
}
st
