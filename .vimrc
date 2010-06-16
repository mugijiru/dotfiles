let skk_jisyo = '~/.skk-jisyo'
let skk_large_jisyo = $VIM . '/usr/share/skk/SKK-JISYO.L'
let skk_auto_save_jisyo = 1
let skk_keep_state = 0
let skk_egg_like_newline = 1
let skk_show_annotation = 1
let skk_use_face = 1

" 行番号を表示
set number

" tab を space に展開
set expandtab

" バックアップを自動生成
set backup

" /tmp と /private/tmp ではバックアップを作らない
set backupskip=/tmp/*,/private/tmp/*"

" = や == の前後にスペースを付加
inoremap <expr> = smartchr#one_of(' = ', ' == ', '=')

" ">"を押すたびに、 > => => '' => "" を入力
inoremap <expr> = smartchr#one_of(' > ', ' => ')


" Tab と 改行 の可視化
set list
set listchars=tab:>-

" 行末の空白文字を可視化
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhitespaceEOL /\s\+$/

" 行頭のTAB文字を可視化
highlight TabSOL ctermbg=red guibg=red
match TabSOL /^\t\+/
autocmd WinEnter * match TabSOL /^\t\+/

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=red
match ZenkakuSpace /　/

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

