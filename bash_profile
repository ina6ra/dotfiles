# replace 18.04 by the number of release you want
if [[ $(lsb_release -rs) == "18.04" ]]; then
  # HSTR configuration - add this to ~/.bashrc
  alias hh=hstr                    # hh to be alias for hstr
  export HSTR_CONFIG=hicolor       # get more colors
  shopt -s histappend              # append new history items to .bash_history
  export HISTCONTROL=ignorespace   # leading space hides commands from history
  export HISTFILESIZE=10000        # increase history file size (default is 500)
  export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
  # ensure synchronization between bash memory and history file
  export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
  # if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
  if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
  # if this is interactive shell, then bind 'kill last command' to Ctrl-x k
  if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
else
  # echo "Non-compatible version"
  source /usr/share/doc/fzf/examples/key-bindings.bash
  __fzf_history__() {
    if type tac > /dev/null 2>&1; then tac="tac"; else tac="tail -r"; fi
    shopt -u nocaseglob nocasematch
    echo $(HISTTIMEFORMAT= history | command $tac | sed -e 's/^ *[0-9]\{1,\}\*\{0,1\} *//' -e 's/ *$//' | awk '!a[$0]++' |
      FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS --sync -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m" $(__fzfcmd))
  }
  bind '"\C-r": " \C-e\C-u\C-y\ey\C-u`__fzf_history__`\e\C-e\er\e^"'
fi

export HISTCONTROL=ignoreboth
