#!/usr/bin/env bash
set -euo pipefail

main () {
  while [ $# -ne 0 ]
  do
    local giturl="$1"
    shift
    local path=.vim/bundle/"$(echo "$giturl" | tr / '\n' | tail -n1 | cut -f1 -d.)"

    git submodule add -- "$giturl" "$path"
  done
}

main \
  git://github.com/tpope/vim-commentary.git \
  git://github.com/altercation/vim-colors-solarized.git \
  git://github.com/tpope/vim-fugitive.git \
  git://github.com/tpope/vim-surround.git \
  git://github.com/airblade/vim-gitgutter.git \
  git://github.com/tpope/vim-abolish.git \
  git://github.com/tpope/vim-repeat.git \
  git://github.com/godlygeek/tabular.git \
  git://github.com/jalvesaq/Nvim-R.git \
  git://github.com:rhysd/vim-grammarous.git \
  git://github.com/bhurlow/vim-parinfer.git \
  git://github.com/vimwiki/vimwiki.git \
  git://github.com/vlime/vlime.git

