#!/bin/bash

st() {

  usage() {
    echo ""
    echo "Performs 'git status' on all subfolders that are valid git repositories."
    echo ""
    echo "  pull [options]"
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

  prompt() {
    local __result=$1
    if [ $prompt -eq 0 ]; then
      local rc='y'
      eval $__result="'$rc'"
      return
    fi
    read -p "Proceed? [yNq] " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      echo ""
      echo ">yes<"
      local rc='y'
      eval $__result="'$rc'"
      return
    fi
    if [[ $REPLY =~ ^[Qq]$ ]]; then
      echo ""
      echo ">quit<"
      local rc='q'
      eval $__result="'$rc'"
      return
    fi
    if [[ $REPLY =~ ^[Nn]$ ]]; then
      echo ""
      echo ">no<"
      local rc='n'
      eval $__result="'$rc'"
      return
    fi
    echo ">no<"
    local rc='n'
    eval $__result="'$rc'"
  }

  if ! test -d "$basedir"; then
    echo "Folder does not exist"
    return
  fi
  pushd "$basedir" &> /dev/null
  for dir in "$basedir"/*; do
    if test -d "$dir/.git"; then
      echo ""
      echo -e "\e[40;38;5;82m PROCESSING \e[30;48;5;82m ${dir:$basedirLength} \e[0m"
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
  popd &> /dev/null
}
