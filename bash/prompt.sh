#!/bin/bash
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
    echo -e "\e[36m>yes<\e[0m"
    echo ""
    local rc='y'
    eval $__result="'$rc'"
    return
  fi
  if [[ $REPLY =~ ^[Qq]$ ]]; then
    echo ""
    echo -e "\e[36m>quit<\e[0m"
    echo ""
    local rc='q'
    eval $__result="'$rc'"
    return
  fi
  if [[ $REPLY =~ ^[Nn]$ ]]; then
    echo ""
    echo -e "\e[36m>no<\e[0m"
    echo ""
    local rc='n'
    eval $__result="'$rc'"
    return
  fi
  echo -e "\e[36m>no<\e[0m"
  local rc='n'
  eval $__result="'$rc'"
}
