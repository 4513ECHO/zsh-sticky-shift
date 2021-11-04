STICKY_SHIFT_KEY="${STICKY_SHIFT_KEY:-;}"
STICKY_TABLE="${STICKY_TABLE:-jis}"
STICKY_DELAY="${STICKY_DELAY:-1}"

function sticky-shift () {
  local char result old_RBUFFER
  typeset -A jis_table us_table sticky_table special_table

  jis_table=(
    '_1' '!' '_2' '"' '_3' '#' '_4' '$' '_5' '%' '_6' '&' '_7' \'
    '_8' '(' '_9' ')' '_-' '=' '_^' '~' '_¥' '|' '_@' '`' '_[' '{'
    '_;' '+' '_:' '*' '_]' '}' '_,' '<' '_.' '>' '_/' '?'
  )
  # TODO: support US keyboard
  us_table=(
    '_1' '!' '_2' '@' '_3' '#' '_4' '$' '_5' '%' '_6' '^' '_7' '&'
    '_8' '*' '_9' '(' '_0' ')' '_-' '_' '_=' '+' '_`' '~' _\'  '"' '_\' '|'
    '_;' ':' '_[' '{' '_]' '}' '_,' '<' '_.' '>' '_/' '?'
  )

  if [[ "$STICKY_TABLE" = "jis" ]]; then
    set -A sticky_table ${(kv)jis_table}
  else
    set -A sticky_table ${(kv)us_table}
  fi
  special_table=(
    "_ " $STICKY_SHIFT_KEY "_" $STICKY_SHIFT_KEY
  )

  old_RBUFFER="$RBUFFER"
  RBUFFER=";$RBUFFER"
  zle reset-prompt

  while :;do
    read -k 1 -t $STICKY_DELAY char
    if [[ "$char" =~ [a-z] ]]; then
      result="$(tr '[:lower:]' '[:upper:]' < <(echo "$char"))"
      break
    elif [[ -n "${sticky_table[(i)_$char]}" ]]; then
      result="${sticky_table[_$char]}"
      break
    elif [[ -n "${special_table[(i)_$char]}" ]]; then
      result="${special_table[_$char]}"
      break
    fi
  done

  RBUFFER="$old_RBUFFER"
  LBUFFER="$LBUFFER$result"
}

zle -N sticky-shift
bindkey "$STICKY_SHIFT_KEY" sticky-shift

