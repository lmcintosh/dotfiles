" Lane McIntosh
" ~/.vimrc file

" Basic Settings ---------------------- {{{

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins
let mapleader = ";"       " map leader

set ofu=syntaxcomplete#Complete         " omnicomplete
let g:SuperTabDefaultCompletionType = "context"
set nocompatible                        " prevents vim from emulating vi's bugs
set autoindent                          " automatic indenting
set smartindent                         " smart indenting
set tabstop=4                           " tab length (columns)
set shiftwidth=2                        " tab length with reindent options (columns)
set expandtab                           " tab inserts spaces in insert mode
set smarttab                            " smart tabs
set et                                  " appropriate tab spacing
set showmatch                           " match brackets
set guioptions-=T                       " turn off gui toolbar
set guioptions-=m                       " turn off gui menu
set noerrorbells                        " turn off error bells
set visualbell                          " turn on visual bell
set ruler                               " each window gets status line
set history=500		                " keep 500 lines of command line history
set foldlevelstart=3                    " fold automatically
set lazyredraw                          " redraw only when we need to
set wildmenu                            " tab completion when file browsing
set wildignore+=*.png,*.jpg,*.pdf       " ignore certain files
set title                               " set vim title
set nohls                               " no highlights on search
set incsearch                           " search as you type
set nobackup                            " no backup files
set nowritebackup                       " only in case you don't want a backup file while editing
set noswapfile                          " no swap files
set autoread                            " auto read when file is changed externally
set number                              " show line numbers
set scrolloff=10                        " scroll buffer
set encoding=utf-8                      " file encoding
set cmdheight=1                         " command bar height
set laststatus=2                        " always show the status line
set formatoptions-=or                   " Don't add the comment prefix when I hit enter or o/O on a comment line.
set showcmd		                        " display incomplete commands
set gdefault                            " assume the /g flag on :s substitutions to replace all matches in a line
set undofile                            " generates .un file so undo/redo work even after saving
set ttyfast                             " faster drawing
set noesckeys                           " kills function and cursor keys
set clipboard=unnamed                   " support the Mac OSX clipboard
set cpo+=J                              " two-spacing after sentences
set iskeyword-=_                        " Use _ as a word-separator
set timeoutlen=500                      " Don't wait so long for the next keypress
set tags=./tags;                        " Set the tag file search order

" backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" ignore case when searching, set default to replace on all lines
set ignorecase
set smartcase
set gdefault

" }}}

" Vimscript file settings ---------------------- {{{

augroup filetype_vim
    autocmd!
    autocmd FileType vim,zsh setlocal foldmethod=marker
augroup END

" editing and sourcing vimrc
noremap <Leader>erc :tabf ~/.vimrc<CR>
noremap <Leader>src :source ~/.vimrc<CR>

" }}}

" Git ---------------------- {{{

" Enter insert mode automatically when editing git commit messages
augroup git
    autocmd!
    autocmd FileType gitcommit startinsert
augroup END

" vim-fugitive aliases
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gp :Git push origin master<CR>
noremap <Leader>gl :Git pull origin master<CR>

" }}}

" Navigation ---------------------- {{{

" dealing with windows
noremap <Leader>j <C-w>j<CR>
noremap <Leader>k <C-w>k<CR>
noremap <Leader>l <C-w>l<CR>
noremap <Leader>h <C-w>h<CR>
noremap <Leader>x <C-w>c<CR>

" move tabs with ctrl+k and ctrl+j
noremap <c-j> :tabp<CR>
noremap <c-k> :tabn<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
noremap <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>t :tabf <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>
noremap <Leader>q :q<CR>

" get current director
function! CurDir()
    let curdir = substitute(getcwd(), '/Users/lmcintosh/', "~/", "g")
    return curdir
endfunction

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" change to common directories
noremap <Leader>db :cd ~/Dropbox<cr>
noremap <Leader>doc :cd ~/Documents<cr>
noremap <Leader>proj :cd ~/code/projects<cr>
noremap <Leader>.. :cd ..
noremap <Leader>cd :cd<space>

" }}}

" Plugins ---------------------- {{{

" vim-airline (statusline)
let g:airline_symbols = {}
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_theme='powerlineish'

" ctrl-p (CtrlP)
let g:ctrlp_map = '<c-t>'
"map <c-t> :CtrlP .<cr>

" map comment commands (NERD Commenter)
map <Leader>mm <Leader>c<space>

" syntastic
let g:syntastic_enable_signs=0
nnoremap <Leader>esnip :tabf ~/.vim/bundle/snipMate/snippets/

" vim-slime
let g:slime_target = "tmux"

" dash
nmap <silent> <leader>d <Plug>DashSearch
nnoremap K :call investigate#Investigate()<CR>
let g:investigate_use_dash=1

" tabularize (alignment)
nmap <Leader>= :Tabularize /=<CR>
nmap <Leader>% :Tabularize /%<CR>
nmap <Leader># :Tabularize /#<CR>
vmap <Leader>= :Tabularize /=<CR>
vmap <Leader>% :Tabularize /%<CR>
vmap <Leader># :Tabularize /#<CR>

" vim-mustache-handlebars
let g:mustache_abbreviations = 1

" }}}

" FileType-specific settings ---------------------- {{{

" insert function comment line (matlab)
noremap <Leader>func <Esc>gg4jyykPi% <Esc>ldw0

augroup filetype_python
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType python inoremap # #
augroup END

" When loading text files, wrap them and don't split up words. Automatically
" save new text files.
augroup textfiles
    autocmd!
    autocmd BufNewFile,BufRead *.txt setlocal wrap
    autocmd BufNewFile,BufRead *.txt setlocal lbr
    autocmd BufNewFile *.txt write
    autocmd BufNewFile *.md  write
    autocmd BufNewFile *.mkd write
augroup END

" fix comment auto-indenting for different languages
autocmd FileType matlab inoremap % %

augroup web
    autocmd!

    " for CSS, also have things in braces indented:
	autocmd FileType css set smartindent

    " for HTML, generally format text, but if a long line has been created
    " leave it alone when editing:
	autocmd FileType html set formatoptions+=tl

    " for both CSS and HTML, use genuine tab characters for
    " indentation, to make files a few bytes smaller:
	autocmd FileType html,css set noexpandtab tabstop=2

    " closetag
    autocmd FileType html,xml,xsl source ~/Git/dotfiles/vim/closetag.vim
    let g:closetag_html_style=1

    " don't wrap html
	autocmd BufWritePre,BufRead *.html setlocal nowrap

    " format XML files
	autocmd FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

    " Beautify
    " for JS
    "autocmd FileType javascript noremap <buffer>  <c-p> :call JsBeautify()<cr>
    " for html
    "autocmd FileType html noremap <buffer> <c-p> :call HtmlBeautify()<cr>
    " for css or scss
    "autocmd FileType css noremap <buffer> <c-p> :call CSSBeautify()<cr>

augroup END

" }}}

" Utilities ---------------------- {{{

" add semicolon to the end of the line
nnoremap  <Leader>j; <Esc>$a;<Esc>j;;
inoremap  <Leader>j; <Esc>$a;<Esc>j;;

" }}}

" Save/Copy/Paste ---------------------- {{{

" to save
noremap <space> :w<CR>
nnoremap <Leader>w :w<CR>
inoremap <Leader>w <ESC>:w<CR>

" save when focus is lost
"augroup focus
    "autocmd!
    "autocmd FocusLost * :wa
"augroup END

" copy all
noremap <Leader>co ggvG$y

" select line
noremap <Leader>vl 0v$

" copy line (to clipboard)
noremap <Leader>cl 0v$y:call system("pbcopy", getreg("\""))<CR>

" edit rest of line
noremap <Leader>cx v$hxa

" pasting
noremap <Leader>p :set paste<CR><c-v><ESC>:set nopaste<CR>
nmap <c-P> <Plug>yankstack_substitute_older_paste

" copy/paste with ctrl+c and ctrl+v in OSX
vnoremap <c-c> y:call system("pbcopy", getreg("\""))<CR>
nnoremap <c-v> :call setreg("\"",system("pbpaste"))<CR>p

" delete until previous line
noremap <Leader>b 0whvgelxi<space><Esc>

" }}}

" Abbreviations and Typos ---------------------- {{{

" prose typos
iabbrev @@      lmcintosh@stanford.edu
iabbrev adn     and
iabbrev tehn    then
iabbrev waht    what
iabbrev teh     the
iabbrev nriu    niru

" command typos
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

" TeX
augroup TeX
    autocmd!
    autocmd FileType tex iabbrev <buffer> alpha   \alpha
    autocmd FileType tex iabbrev <buffer> beta    \beta
    autocmd FileType tex iabbrev <buffer> delta   \delta
    autocmd FileType tex iabbrev <buffer> gamma   \gamma
    autocmd FileType tex iabbrev <buffer> eta     \eta
    autocmd FileType tex iabbrev <buffer> epsilon \epsilon

    " surround with $
    autocmd FileType tex nnoremap 44 i$<Esc>ea$<Esc>
    autocmd FileType tex nnoremap 77 i&<Esc>ea&<Esc>
augroup END

" }}}

" Highlights, colors and themes ---------------------- {{{

" Colorscheme (put this first)
set background=dark
colorscheme slate

" color column
highlight ColorColumn guibg=#303030
let &colorcolumn="80"

" highlight spelling errors
hi clear SpellBad
hi SpellBad guibg=#c62323 term=reverse
noremap <Leader>sp :set spell!<CR>

" highlight bad whitespace
"augroup coloring
    "autocmd!
    "autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    "autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    "autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"augroup END
nnoremap <silent> <Leader>wsp :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Make the omnicomplete text readable
highlight PmenuSel guifg=cyan guibg=#303030
highlight Pmenu guifg=#cccccc guibg=#303030

" cursor colors
hi Cursor guifg=cyan guibg=grey
set guicursor=n-c-v:ver100-blinkwait500-blinkon300-blinkoff200-Cursor

" fonts
if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 16
elseif has("gui_macvim")
    set guifont=Andale_Mono:h16
    let g:Powerline_symbols = 'fancy'
endif

" }}}

" Generic Mappings ---------------------- {{{

" folding
noremap <Leader>a zA

" indent lines
nnoremap <tab> I<tab><esc>

" to escape
inoremap kj <Esc>
inoremap jk <Esc>

" Center search matches when jumping
noremap N Nzz
noremap n nzz

" common terminal commands
noremap <Leader>ls :!ls<CR>

" Emacs-like beginning and end of line.
inoremap <c-e> <c-o>$
inoremap <c-a> <c-o>^

" }}}

"" Functions ---------------------- {{{

" show if I am in paste mode
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" }}}
