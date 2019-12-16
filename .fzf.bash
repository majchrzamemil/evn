# Setup fzf
# ---------
if [[ ! "$PATH" == */home/eemimaj/.fzf/bin* ]]; then
  export PATH="$PATH:/home/eemimaj/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/eemimaj/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/eemimaj/.fzf/shell/key-bindings.bash"

