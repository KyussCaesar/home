#!/usr/bin/env bash
set -euo pipefail

main () {
  while [ $# -ne 0 ]
  do
    local giturl="git://github.com/$1"
    shift
    local path=.vim/bundle/"$(echo "$giturl" | tr / '\n' | tail -n1 | cut -f1 -d.)"

    if ! [ -a "$path" ]
    then
      git submodule add -- "$giturl" "$path"
    else
      echo >&2 "warn: path for '$giturl' ($path) already exists, skip adding it"
    fi
  done
}

main \
  tpope/vim-commentary.git \
  altercation/vim-colors-solarized.git \
  tpope/vim-fugitive.git \
  tpope/vim-surround.git \
  airblade/vim-gitgutter.git \
  tpope/vim-abolish.git \
  tpope/vim-repeat.git \
  godlygeek/tabular.git \
  jalvesaq/Nvim-R.git \
  rhysd/vim-grammarous.git \
  bhurlow/vim-parinfer.git \
  vimwiki/vimwiki.git \
  vlime/vlime.git \
  wgwoods/vim-systemd-syntax

