#!/usr/bin/env bash

PROFILE_NAME="chalk"
PROFILE_SLUG="5b664499-46b5-481b-a6cc-c4f93a506b89"

COLOR_01="#646464" # HOST
COLOR_02="#F58E8E" # SYNTAX_STRING
COLOR_03="#A9D3AB" # COMMAND
COLOR_04="#FED37E" # COMMAND_COLOR2
COLOR_05="#7AABD4" # PATH
COLOR_06="#D6ADD5" # SYNTAX_VAR
COLOR_07="#79D4D5" # PROMP
COLOR_08="#D4D4D4" #

COLOR_09="#646464" #
COLOR_10="#F58E8E" # COMMAND_ERROR
COLOR_11="#A9D3AB" # EXEC
COLOR_12="#FED37E" #
COLOR_13="#7AABD4" # FOLDER
COLOR_14="#D6ADD5" #
COLOR_15="#79D4D5" #
COLOR_16="#D4D4D4" #

BACKGROUND_COLOR="#2D2D2D"
FOREGROUND_COLOR="#D4D4D4"

CURSOR_COLOR="$FOREGROUND_COLOR"

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../gterm-theme-apply.sh"
