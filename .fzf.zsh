# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mugijiru/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/mugijiru/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mugijiru/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/mugijiru/.fzf/shell/key-bindings.zsh"
