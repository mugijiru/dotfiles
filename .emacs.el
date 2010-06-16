;; -*- coding: utf-8 -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 全体的な設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 使う言語を日本語utf-8に
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ロードパスの設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (file-directory-p "/usr/local/share/emacs/site-lisp/")
    (setq load-path (append '("/usr/local/share/emacs/site-lisp/") load-path)))

(if (file-directory-p "/usr/share/emacs/22.1/site-lisp/skk/")
    (setq load-path (append '("/usr/share/emacs/22.1/site-lisp/skk/") load-path)))

(if (file-directory-p "/usr/share/emacs/site-lisp/w3m/")
    (setq load-path (append '("/usr/share/emacs/site-lisp/w3m/") load-path)))

(if (file-directory-p (expand-file-name "~/.emacs.d/site-lisp/"))
    (setq load-path (append (list (expand-file-name "~/.emacs.d/site-lisp/")) load-path)))

(if (file-directory-p (expand-file-name "~/.emacs.d/site-lisp/emms/lisp"))
    (add-to-list 'load-path "~/.emacs.d/site-lisp/emms/lisp/"))

(if (file-directory-p (expand-file-name "~/.emacs.d/auto-install/"))
    (add-to-list 'load-path "~/.emacs.d/auto-install/"))


;; SKKの設定(日本語入力)
;(if (not (eq window-system 'mac))
;    (progn
;      (require 'skk-autoloads)
;      (global-set-key "\C-x\C-j" 'skk-mode)))
(require 'skk-autoloads)
(global-set-key "\C-x\C-j" 'skk-mode)

(if (eq window-system 'mac)
    (progn
      (setq skk-large-jisyo "/Users/nuehara/Library/AquaSKK/SKK-JISYO.L")
      (setq mac-pass-control-to-system nil)))

;; Anthy の設定(日本語入力)
;(load-library "anthy")
;(setq default-input-method "japanese-anthy")
;(global-set-key "\C-o" 'anthy-mode) ; C-oでAnthyのオンオフ
;(global-set-key [?\S- ] 'anthy-mode); Shift+SpaceでAnthyのオンオフ
;(setq anthy-wide-space " "); オンの時のスペースを半角にする。

;(custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
; '(inhibit-startup-screen t))
;(custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
; )

;(setq load-path (append '("/usr/local/share/emacs/site-lisp/anthy/")
;load-path))


;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; キーバインド
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

; C-h を backspace に
;(global-set-key "\C-h" 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)
(global-set-key "\C-h" nil)

;; M-rをstring-replaceに割り当て
(global-set-key "\M-r" 'replace-string)

;; Shift+矢印でwindow移動
(windmove-default-keybindings)

;; dvorak配列(使ってみたいから貼ってみた)
(defun dvorak ()
  "Dvorak keyboard table"
  (interactive)
  (setq keyboard-translate-table "\C-@\C-a\C-b\C-c\C-d\C-e\C-f\C-g\C-h\C-i\C-j\C-k\C-l\C-m\C-n\C-o\C-p\C-q\C-r\C-s\C-t\C-u\C-v\C-w\C-x\C-y\C-z\033\034\035\036\037 !_#$%&-()*+w`vz0123456789SsW=VZ@AXJE>UIDCHTNMBRL\"POYGK<QF:[\\]^~/axje.uidchtnmbrl'poygk,qf;{?}~?C-?"))

(defun qwerty ()
  "Qwerty keyboard table"
  (interactive)
  (setq keyboard-translate-table nil))
;(dvorak)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; マウスの設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; スクロールの速さを遅くする
(global-set-key [wheel-up] '(lambda () "" (interactive) (scroll-down 1)))
(global-set-key [wheel-down] '(lambda () "" (interactive) (scroll-up 1)))
(global-set-key [double-wheel-up] '(lambda () "" (interactive) (scroll-down 1)))
(global-set-key [double-wheel-down] '(lambda () "" (interactive) (scroll-up 1)))
(global-set-key [triple-wheel-up] '(lambda () "" (interactive) (scroll-down 2)))
(global-set-key [triple-wheel-down] '(lambda () "" (interactive) (scroll-up 2)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 表示設定
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; 起動画面の抑制
(setq inhibit-startup-message t)

;フォントサイズ設定
(if (not (eq window-system 'mac))
    (set-face-font 'default "-*-fixed-medium-r-*-*-14-*"))

; 対応する括弧を光らせる
(show-paren-mode t)

; 括弧が画面外にある場合は括弧内をハイライト表示
(set-face-background 'show-paren-match-face "gray10")
(set-face-foreground 'show-paren-match-face "SkyBlue")

; 今いる行を目立たせる
;(require 'hl-line)
;(global-hl-line-mode)

;;; 全角スペース、タブ、行末のスペースを可視化
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:background "red"))) nil)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-b-2 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-u-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

; dired で使う ls のオプション
(setq dired-listing-switches "-Flha")

; 現在の関数名をモードラインに表示
(which-function-mode t)

; キーバインドの通知
(setq suggest-key-bindings t)

;ビープ音をビジュアルベルに変更
(setq visible-bell t)

; 左に行数表示
(require 'linum)
;(global-linum-mode t)

; モードラインの行番号非表示
; 左に行数が表示されているため
(line-number-mode nil)

; モードラインに行頭からの位置を表示
(column-number-mode t)

; バッテリーモード
(display-battery-mode t)
(if (eq window-system 'mac)
    (setq battery-mode-line-format "[%b%p%%(%m)]")
  (setq battery-mode-line-format "[%b%p%%(%m),%d°C]"))

;; 同一バッファ名の場合にディレクトリ名を付加
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

; 分割画面でも折り返し
(setq truncate-partial-width-windows nil)

;;====================================
;;; 折り返し表示ON/OFF
;;====================================
;(defun toggle-truncate-lines ()
;  "折り返し表示をトグル動作します."
;  (interactive)
;  (if truncate-lines
;      (setq truncate-lines nil)
;    (setq truncate-lines t))
;  (recenter))
;
;(global-set-key "\C-c\C-;" 'toggle-truncate-lines) ; 折り返し表示ON/OFF

;;; フレーム最大化
(if (eq window-system 'mac)
    (add-hook 'window-setup-hook
              (lambda ()
;;                (setq mac-autohide-menubar-on-maximize t)
                (set-frame-parameter nil 'fullscreen 'fullboth)
                ))
  (set-frame-parameter nil 'fullscreen 'fullboth))

; fullscreenかどうかの切り替え。使ってないのでcomment out
;(defun mac-toggle-max-window ()
;  (interactive)
;  (if (frame-parameter nil 'fullscreen)
;      (set-frame-parameter nil 'fullscreen nil)
;    (set-frame-parameter nil 'fullscreen 'fullboth)))

;; Carbon Emacsの設定で入れられたメニューを隠したり．
(custom-set-variables
 '(display-time-mode t)           ; なんとかラインに時間表示
 '(tool-bar-mode nil)             ; ツールバー非表示
 '(transient-mark-mode t)         ; 選択したリージョンをハイライト表示
 '(menu-bar-mode nil))            ; メニューバー非表示
(custom-set-faces)


; アクティブなバッファをハイライト表示
; いまいち動作がおかしいのでコメントアウト
;(require 'hiwin)
;(hiwin-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; 編集周り
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; indent にタブを使わない
(setq-default indent-tabs-mode nil)

; (yes/no) を (y/n)に
(fset 'yes-or-no-p 'y-or-n-p)

; OSのクリップボードを使う
(setq x-select-enable-clipboard t)

;; 簡単に一括置換ができるelisp、らしい
;(require 'iedit)
;(define-key global-map (kbd "C-:") 'iedit-mode)
;(define-key isearch-mode-map (kbd "C-:") 'iedit-mode)

; 画像を見られるように
(auto-image-file-mode t)

;保存時に行末の無駄な空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; migemo(英字のままで日本語検索)
(if (eq window-system 'mac)
    (progn
      (setq exec-path (cons "/opt/local/bin" exec-path))
      (load "migemo.el")))

;; auto-complete(自動補完)
(require 'auto-complete)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-buffer ac-source-symbols ac-source-words-in-all-buffer))

;;; view-mode
;; .emacs.d/site-lisp/view-mode-key.el の読み込み
(load "view-mode-key")

;; C-x C-y または C-x y で view-mode を切り替える
(defun toggle-view-mode ()
  (interactive)
  (cond (view-mode
      (view-mode nil)
      (setq hl-line-mode nil))
    (t
      (view-mode))))
(define-key global-map "\C-x\C-y" 'toggle-view-mode)
(define-key global-map "\C-x\ y" 'toggle-view-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; ファイル検索など
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; recentf-mode(最近使ったファイル一覧)
(require 'recentf)
(recentf-mode t)

;; anything.el(なんでもここから開いたり実行したり)
(require 'anything-config)
(require 'anything-w3m)
(require 'anything-match-plugin)
(require 'anything-migemo)
(require 'anything-emms)
;(setq anything-use-migemo nil)

(add-to-list 'anything-c-source-emms-dired '(migemo))
(add-to-list 'anything-c-source-emms-directory '(migemo))
(add-to-list 'anything-c-source-emms-playlist '(migemo))
(add-to-list 'anything-c-source-w3m-bookmarks '(migemo))
(add-to-list 'anything-c-source-locate '(migemo))
(add-to-list 'anything-c-source-arrived-url-history '(migemo))

(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-kill-ring
                             anything-c-source-recentf
                             anything-c-source-w3m-bookmarks
                             anything-c-source-file-name-history
                             anything-c-source-arrived-url-history
                             anything-c-source-emacs-commands
                             anything-c-source-emms-dired
                             anything-c-source-emms-directory
;                             anything-c-source-emms-playlist
;                             anything-c-source-emms-file
                             anything-c-source-locate
                             anything-c-source-minibuffer-history
                             anything-c-source-bookmarks
                             anything-c-source-man-pages
;                             anything-c-source-top
                             ))
(if (eq window-system 'mac)
    (progn
      (add-to-list 'anything-c-source-mac-spotlight '(migemo))
      (setq anything-sources (append '(anything-c-source-mac-spotlight) anything-sources))))

(define-key anything-map (kbd "C-p") 'anything-previous-line)
(define-key anything-map (kbd "C-n") 'anything-next-line)
(define-key anything-map (kbd "M-n") 'anything-next-source)
(define-key anything-map (kbd "M-p") 'anything-previous-source)
(define-key anything-map (kbd "C-v") 'anything-next-page)
(define-key anything-map (kbd "M-v") 'anything-previous-page)
(define-key anything-map (kbd "C-s") 'anything-isearch)
(global-set-key (kbd "C-;") 'anything)
;(global-set-key (kbd "C-:") 'anything-migemo)


;(require 'anything-complete)
;(anything-read-string-mode 1)
;(anything-lisp-complete-symbol-set-timer 150)
;(setq anything-lisp-complete-symbol-input-idle-delay 0.0)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; プログラム一般
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; smartchr.el('=' の前後に改行をつけてくれたり)
;(require 'smartchr)

;; = と == の前後にスペースを入れる。3回 = を押すとスペースなしの=に
;(global-set-key (kbd "=") (smartchr '(" = " " == " "=")))

;; + の前後にスペースを入れるなど。
;(global-set-key (kbd "+") (smartchr '(" + " " ++ " "+")))
;(global-set-key (kbd "-") (smartchr '(" - " " -- " "-")))
;(global-set-key (kbd "/") (smartchr '(" / " "// " "/")))
;(global-set-key (kbd "&") (smartchr '(" & " " && " "&")))
;(global-set-key (kbd "%") (smartchr '(" % " "%")))
;(global-set-key (kbd ",") (smartchr '(", " ",")))


;; ">"を押すたびに、 > => => '' => "" を入力
;(global-set-key (kbd ">") (smartchr '(">" " => " " => '`!!''" " => \"`!!'\"")))


;;; yasnippet
;; load-pathにyasnippetのパスを通す
(setq load-path (cons (expand-file-name "~/.emacs.d/site-lisp/yasnippet") load-path))

;; yasnippetのロード
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/site-lisp/yasnippets-rails/rails-snippets/")
;(yas/load-directory "~/.emacs.d/site-lisp/snippets/")

;; yaml-mode
(if (eq window-system 'mac)
    (progn
      (require 'yaml-mode)
      (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Ruby周り
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; end とかを自動補完してくれる
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

;; rcodetools
(require 'rcodetools)
(require 'anything-rcodetools)

; ruby-debug(Rubyのデバッガ)
(autoload 'rubydb "rubydb3x"
  "run rubydb on program file in buffer *gud-file*.
the directory containing file becomes the initial working directory
and source-file directory for your debugger." t)

;; feature mode(Cucumberのフィーチャ)
(if (not (eq window-system 'mac))
    (require 'feature-mode))


;;;; Rails周り

;; Rinari -- elisp for rails
; ido
(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/site-lisp/rinari")
(require 'rinari)

;;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/site-lisp/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
    (lambda () (rinari-launch)))

;; haml-mode
(require 'haml-mode nil 't)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; sass-mode
(require 'sass-mode nil 't)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))


;;;; その他プログラム周り

; 使ってないからとりあえずcomment out
;;; actionscript-mode
;
;(autoload 'actionscript-mode "actionscript-mode" "actionscript" t)
;(setq auto-mode-alist
;      (append '(("\\.as$" . actionscript-mode))
;                 auto-mode-alist))
;
;
;;; mmm-mode
;(require 'mmm-mode)
;(setq mmm-global-mode 'maybe)
;(set-face-background 'mmm-default-submode-face "navy") ; color
;
;(mmm-add-classes
; '((embedded-as
;    :submode actionscript-mode
;    :front "<![CDATA["
;    :back "]]>")))
;(mmm-add-mode-ext-class nil "\\.mxml.erb?\\'" 'embedded-as)
;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Web周り
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; emacs-w3m
(require 'w3m-load)
(setq w3m-use-cookies t)
(setq w3m-search-default-engine "google")
(setq w3m-weather-default-area "沖縄県・本島中南部")
(setq w3m-default-display-inline-images t)

;;; browse-url
;;;   以下のように設定しておくと、URI に類似した文字列がある場所で C-x m と
;;;   入力すれば、w3m で表示されるようになる。
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(global-set-key "\C-xm" 'browse-url-at-point)

;(setq w3m-content-type-alist
;      (cons
;       '("text/html" "\\.s?html?$" browse-url-firefox) w3m-content-type-alist))

;; twittering-mode
(require 'twittering-mode)
(require 'twittering-config)


;; msn.el
;(require 'messenger)
; 動かね

;; mew
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

;(if (boundp 'read-mail-command)
;  (setq read-mail-command 'mew))
;(autoload 'mew-user-agent-compose "mew" nil t)
;(if (boundp 'mail-user-agent)
;  (setq mail-user-agent 'mew-user-agent))
;(if (fboundp 'define-mail-user-agent)
;  (define-mail-user-agent
;    'mew-user-agent
;    'mew-user-agent-compose
;    'mew-draft-send--message
;    'mew-draft-kill
;    'mew-send-hook))

; wassr.el うごかね
;(require 'wassr)

;;; newstciker
(if (file-directory-p (expand-file-name "~/.emacs.d/site-lisp/newsticker-1.99"))
    (add-to-list 'load-path "~/.emacs.d/site-lisp/newsticker-1.99"))

(autoload 'w3m-region "w3m"
  "Render region in current buffer and replace with result." t)
(setq newsticker-html-renderer 'w3m-region)
;
;;; IRC client
;(autoload 'riece "riece" "Start Riece" t)

;; cacoo.el
(require 'cacoo)
(global-set-key (kbd "M--") 'toggle-cacoo-minor-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; その他、外部プログラムなど
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; doc-view (PDFリーダ)
(require 'doc-view)
(global-set-key (kbd "C-c C-d") 'doc-view)

;; ansi-term(シェル操作)
(require 'term)
(global-set-key "\C-c\C-t" '(lambda ()(interactive)(ansi-term "/bin/zsh")))
(defvar ansi-term-after-hook nil)
(add-hook 'ansi-term-after-hook
          (function
           (lambda ()
             (define-key term-raw-map "\C-c\C-t"
               '(lambda ()(interactive)(ansi-term "/bin/zsh"))))))

(defadvice ansi-term (after ansi-term-after-advice (arg))
  "run hook as after advice"
  (run-hooks 'ansi-term-after-hook))
(ad-activate 'ansi-term)


;; emms(音楽プレイヤー)
(require 'emms-setup)
(require 'emms-i18n)
(emms-standard)
(emms-default-players)
(setq emms-repeat-playlist t)
(setq emms-player-list '(emms-player-mplayer))
(if (eq window-system 'mac)
    (setq emms-source-file-default-directory "~/Music/iTunes/iTunes Music/")
  (require 'emms-volume)
  (setq emms-source-file-default-directory "~/ogg/"))


;;; mpg123.el(mp3プレイヤー。emmsを使うようになったので用済み)
;(autoload 'mpg123 "mpg123" "A Front-end to mpg123" t)
;(setq mpg123-mpg123-command "mpg321") ; mpg123のコマンド名
;(setq mpg123-startup-volume 70)       ; 起動時の音量
;(setq mpg123-default-repeat -1)       ; 繰り返し回数。-1は永遠に繰り返す。
;(setq mpg123-default-dir              ; 起動時のディレクトリ
;      (expand-file-name "~/.w3m/"))


;; org-mode(GTDなど)
(require 'org-install)
(require 'org)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/hha.org" "~/org/hrm.org"))
(define-key org-mode-map [(shift control return)] 'org-insert-todo-heading)
(add-hook 'org-mode-hook 'turn-on-font-lock)
(setq org-mobile-directory "~/Dropbox/MobileOrg")
;(setq org-mobile-inbox-for-pull "~/org/hrm.org")
(defun org-summary-todo (n-done n-not-done)
  "サブエントリーのステータスが全てDONEになったら親エントリーのステータスもDONEにする"
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
(setq org-todo-keywords
       '((sequence "TODO" "DOING(!)" "|" "DONE")))

; 開く時にorg-mobile-pullする
(add-hook 'org-mode-hook 'org-mobile-pull)

; 保存時にorg-mobileにpushする。
(add-hook 'org-mode-hook
          (lambda() (add-hook 'after-save-hook
                              'org-mobile-push t)))
;; screenshot.el
;(require 'screenshot)
;(setq screenshot-schemes              ; edit as you like
;      '(
;        ;; To local image directory
;        ("local"
;         :dir "~/screenshots/")            ; Image repository directory
;        ;; To current directory
;        ("current-directory"          ; No need to modify
;         :dir default-directory)))
;
;(setq screenshot-default-scheme "local") ; default scheme is "local"
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs Lispの自動インストール
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; auto-install.el
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/auto-install/")
;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(global-set-key "\C-c\C-i" 'auto-install-from-emacswiki)
;(require 'oddmuse) ; EmacsWikiページの補完


