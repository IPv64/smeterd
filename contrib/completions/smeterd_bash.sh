_smeterd_bash_completion()
{
  local cur=${COMP_WORDS[COMP_CWORD]}
  local prev=${COMP_WORDS[COMP_CWORD-1]}

  case "$prev" in
    -h|--help|--version)
      return 0
      ;;

    read-meter)
      local opts="-h --help --serial-port -p -r -d --database"
      ;;

    webserver)
      local opts="-h --help -b --bind -r --auto-reload -d --database"
      ;;

    report)
      local opts="-h --help -d --database"
      ;;

    -d|--database)
      COMPREPLY=( $(compgen -o filenames -A file -- $cur) )
      return 0
      ;;

    -p|--serial-port)
      local opts="$(ls /dev/tty*)"
      ;;

    *)
      local opts="-h --help --version -v -q webserver report read-meter"
      ;;
  esac
  
  COMPREPLY=( $(compgen -W "$opts" -- $cur) )
}

complete -F _smeterd_bash_completion smeterd
