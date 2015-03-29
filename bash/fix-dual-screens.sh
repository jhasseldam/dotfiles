#!/bin/bash
function fix-dual-screens {

  function usage {
    echo ""
    echo "Usage: $1 \$position"
    echo "  \$position = (right|left)"
  }

  if [[ $# != 1 ]]; then
    echo >&2 "ERROR: Missing arguments"
    usage $FUNCNAME
    return
  fi

  pos=$(echo $1 | tr '[:upper:]' '[:lower:]')
  if [[ ! "$pos" =~ ^(right|left)$ ]]; then
    echo >&2 "ERROR: Position can only have following values: right or left"
    usage $FUNCNAME
    return
  fi

  xrandr --output eDP1 --mode 1280x1024 --output HDMI1 --mode 1280x1024
  xrandr --output HDMI1 --mode 1920x1080 --output eDP1 --mode 1920x1080
  if [ "$pos" = "right" ]; then
    xrandr --output HDMI1 --left-of eDP1
  else
    xrandr --output HDMI1 --right-of eDP1
  fi
}

fix-dual-screens $*
