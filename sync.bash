#!/bin/bash
set -euo pipefail
source ./utils.bash

require-env HOME

# ensure various files/dirs are linked
make-link () {
  while [ $# -ne 0 ]
  do
    local path="${1}"
    shift

    local target="$(pwd)/$path"
    if ! [ -a "$target" ]
    then
      bail 1 "make-link:" "target '$target' does not exist."
    fi

    local link_name="$HOME/$path"
    if [ -h "$link_name" ] && [ "$(realpath "$link_name")" = "$target" ]
    then
      msg "link '$link_name' -> '$target' already exists. Skipping."
      continue
    fi

    local ln_cmd=(ln -T -s)

    if [ -a "$link_name" ]
    then
      yes-or-no "file already exists at '$link_name', overwrite it?"
      case "$REPLY" in
        yes)
          ln_cmd+=(-f)
          ;;
        no)
          msg "ok; skipping."
          continue
          ;;
      esac
    fi

    "${ln_cmd[@]}" "$(pwd)/$path" ~/"$path"
  done
}

make-link \
  .config/i3/config \
  .config/picom/picom.conf \
  .config/systemd \
  .vimrc \
  .vimrc-pager \
  .vim \
  bin

# ensure ~/bin is on PATH

# ensure global gitignore
git config --global core.excludesfile "$(pwd)"/gitignore_global

