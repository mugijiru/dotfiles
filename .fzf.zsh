# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mugijiru/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/mugijiru/.fzf/bin"
fi

# Auto-completion
# ---------------
if [[ $- == *i* ]]; then
  if [ -e "/home/mugijiru/.fzf/shell/completion.zsh" ]; then
    source "/home/mugijiru/.fzf/shell/completion.zsh"
  elif [ -e "/usr/share/fzf/completion.zsh" ]; then
    source "/usr/share/fzf/completion.zsh"
  fi
fi

# Key bindings
# ------------
if [ -e "/home/mugijiru/.fzf/shell/key-bindings.zsh" ]; then
  source "/home/mugijiru/.fzf/shell/key-bindings.zsh"
elif [ -e "/usr/share/fzf/key-bindings.zsh" ]; then
  source "/usr/share/fzf/key-bindings.zsh"
fi

