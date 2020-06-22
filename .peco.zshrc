### 履歴を peco で検索

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle -R -c
}
zle -N peco-select-history

# keybinds
bindkey '^r' peco-select-history

if [ -x "$(command -v peco)" ]; then
    alias ss='ssh $(grep -iE "^host[[:space:]]+[^*]" ~/.ssh/config|sort|uniq|peco|awk "{print \$2}")'
fi
