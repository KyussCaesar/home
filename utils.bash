export SCRIPT_PATH="$(realpath "$0")"
export SCRIPT_NAME="$(basename "$SCRIPT_PATH")"

export UTILHOME="/home/$(whoami)/github/home"

msg () {
  echo >&2 "$SCRIPT_NAME: $@"
}

bail () {
  case $# in
    0)
      exit 1
      ;;
    *)
      local code="${1}"
      msg "$@"
      exit "$code"
      ;;
  esac
}

log () {
  msg "$(date -Is)" "$@"
}

dbug () {
  log "dbug" "$@"
}

info () {
  log "info" "$@"
}

warn () {
  log "warn" "$@"
}

err () {
  log "errr" "$@"
}

ensure-dir () {
  local path="$1"
  [ -d "$path" ] || mkdir -p "$path"
}

require-env () {
  local err=()
  while [ $# -ne 0 ]
  do
    local var="$1"
    shift

    if ! [ -v "$var" ]
    then
      err+=("$var")
    fi
  done

  if [ "${#err[@]}" -ne 0 ]
  then
    bail 1 "the following required environment variables are not set:" "${err[@]}"
  fi
}

yes-or-no () {
  local msg="$1"

  case "$#" in
    0)
      msg="Proceed?"
      ;;
    *)
      msg="$@"
      ;;
  esac

  while :
  do
    read -er -p "$SCRIPT_NAME: $msg [yes/no]: "
    case "$REPLY" in
      Y | y | yes)
        REPLY=yes
        break
        ;;
      N | n | no)
        REPLY=no
        break
        ;;
      *)
        msg "please enter 'yes' or 'no'."
        ;;
    esac
  done
}

showhelp () {
  local usagestr='[ OPTIONS ] [ ARGS ]'

  if [ $# -ne 0 ]
  then
    usagestr="$@"
  fi

  cat >&2 <<EOF
usage: $SCRIPT_NAME [ OPTIONS ] [ ARGS ]
options:
EOF
  grep HELP "$SCRIPT_PATH" |
    sort |
    uniq |
    sed -e 's/^[[:space:]]*/\t/g' -e 's/) #HELP:/\t/g' >&2
}

