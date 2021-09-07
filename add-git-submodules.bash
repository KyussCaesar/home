#!/usr/bin/env bash
set -euo pipefail

main () {
  while [ $# -ne 0 ]
  do
    local giturl="git://github.com/$1.git"
    shift
    local path=.vim/bundle/"$(echo "$giturl" | tr / '\n' | tail -n1)"

    if ! [ -a "$path" ]
    then
      git submodule add -- "$giturl" "$path"
    else
      echo >&2 "warn: path for '$giturl' ($path) already exists, skip adding it"
    fi
  done
}

main \
  tpope/vim-commentary \
  altercation/vim-colors-solarized \
  tpope/vim-fugitive \
  tpope/vim-surround \
  airblade/vim-gitgutter \
  tpope/vim-abolish \
  tpope/vim-repeat \
  godlygeek/tabular \
  jalvesaq/Nvim-R \
  rhysd/vim-grammarous \
  bhurlow/vim-parinfer \
  vimwiki/vimwiki \
  vlime/vlime \
  wgwoods/vim-systemd-syntax \
  ludovicchabant/vim-gutentags

