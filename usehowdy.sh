#!/bin/bash

VERSION=0.0.1

usage () {
  echo "usehowdy [-hV]"
  echo
  echo "Options:"
  echo "  -h|--help      Print this help dialogue and exit"
  echo "  -V|--version   Print the current version and exit"
}

require() {
  SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  source ${SCRIPTDIR}/deps/$1.sh
}

require howdy/howdy

usehowdy () {
  for opt in "${@}"; do
    case "$opt" in
      -h|--help)
        usage
        return 0
        ;;
      -V|--version)
        echo "$VERSION"
        return 0
        ;;
    esac
  done

  ## your code here
  howdy Troy green
}

if [[ ${BASH_SOURCE[0]} != $0 ]]; then
  export -f usehowdy
else
  usehowdy "${@}"
  exit 0
fi
