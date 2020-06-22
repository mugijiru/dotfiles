if [ -x "$(command -v xlhtml)" ]; then
    function xls2w3m() {
        xlhtml $1 | w3m -T text/html
    }

    compdef '_files -g "*.xls"' xls2w3m
fi

# ssconvert は gnumeric の付属コマンド
if [ -x "$(command -v ssconvert)" ]; then
    function xlsx() {
        ssconvert --import-type Gnumeric_Excel:xlsx --export-type Gnumeric_html:xhtml $1 fd://1 | w3m -T text/html
    }

    function xls() {
        ssconvert --import-type Gnumeric_Excel:excel --export-type Gnumeric_html:xhtml $1 fd://1 | w3m -T text/html
    }

    # suffix alias.
    # ex: `./hoge.xls` as execute `xls hoge.xls`
    alias -s xls=xls
    alias -s xlsx=xlsx

    compdef '_files -g "*.xls"' xls
    compdef '_files -g "*.xlsx"' xlsx
fi
