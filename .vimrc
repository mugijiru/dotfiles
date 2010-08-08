"""""""""""""""""""""""""""""""""""""
"
" 全体的な設定
"
"""""""""""""""""""""""""""""""""""""

" バックアップを自動生成
set backup

" /tmp と /private/tmp ではバックアップを作らない
set backupskip=/tmp/*,/private/tmp/*"

"" SKKの設定 ""
let skk_jisyo = '~/.skk-jisyo'
let skk_large_jisyo = $VIM . '/usr/share/skk/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1


"""""""""""""""""""""""""""""""""""""
"
" 表示設定
"
"""""""""""""""""""""""""""""""""""""

" 行番号を表示
set number

" タブ幅を空白文字2文字分に
set tabstop=2

" Tab と 改行 の可視化
set list
set listchars=tab:>-

" 行末の空白文字を可視化
"highlight WhitespaceEOL ctermbg=red guibg=red
"match WhitespaceEOL /\s\+$/
"autocmd WinEnter * match WhitespaceEOL /\s\+$/
highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
au BufWinEnter * let w:m1 = matchadd("WhitespaceEOL", '\s\+$')
au WinEnter * let w:m1 = matchadd("WhitespaceEOL", '\s\+$')


" 行頭のTAB文字を可視化
"highlight TabSOL ctermbg=red guibg=red
"match TabSOL /^\t\+/
"autocmd WinEnter * match TabSOL /^\t\+/
highlight TabSOL ctermbg=red guibg=red
au BufWinEnter * let w:m2 = matchadd("TabSOL", '^\t\+')
au WinEnter * let w:m2 = matchadd("TabSOL", '^\t\+')


" 全角スペースの表示
"highlight ZenkakuSpace cterm=underline ctermbg=red guibg=red
"match ZenkakuSpace /　/
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')


"""""""""""""""""""""""""""""""""""""
"
" 編集周り
"
"""""""""""""""""""""""""""""""""""""

" tab を space に展開
set expandtab

" OSのクリップボードを使う
set clipboard=unnamed

" インクリメンタルサーチを有効に
set incsearch

" バックスペースを直感的に
set backspace=indent,eol,start

" コマンドライン補完時に補完候補を表示
set wildmenu


"""" smartchr関連
" = や == の前後にスペースを付加
inoremap '=' = smartchr#one_of(' = ', ' == ', '=')

" ">"を押すたびに、 > => => '' => "" を入力
inoremap '>' = smartchr#one_of(' > ', ' => ')

" ruby,erubyモードの設定
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" バッファ保存時に行末の無駄な空白を削除
autocmd BufWritePre * :%s/[ \t\r　]\+$//e

