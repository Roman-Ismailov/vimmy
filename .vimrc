set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'sansyrox/vim-python-virtualenv'
Plugin 'alfredodeza/pytest.vim'

"Plugin 'CarloDePieri/pytest-vim-compiler'
Plugin 'tpope/vim-dispatch'
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
"Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'w0ng/vim-hybrid'
"Plugin 'mikelue/vim-maven-plugin'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
"uml
"Plugin 'scrooloose/vim-slumlord'
"Plugin 'aklt/plantuml-syntax'
Plugin 'dbext.vim'
"Plugin 'NLKNguyen/pipe.vim' "required
"Plugin 'NLKNguyen/pipe-mysql.vim'
Plugin 'tpope/vim-surround'
"Plugin 'digitaltoad/vim-pug'
"Plugin 'othree/html5.vim'
"Plugin 'vim-scripts/DrawIt'
Plugin 'JamshedVesuna/vim-markdown-preview'

"https://habr.com/ru/post/468265/
Plugin 'shime/vim-livedown'
"distraction fee mode
Plugin 'junegunn/goyo.vim'

""--------------=== Snippets support ===---------------
"Plugin 'garbas/vim-snipmate'		" Snippets manager
"Plugin 'MarcWeber/vim-addon-mw-utils'	" dependencies #1
"Plugin 'tomtom/tlib_vim'		" dependencies #2
"Plugin 'honza/vim-snippets'		" snippets repo
""---------------=== Languages support ===-------------
"" --- Python ---
""Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim' 		" Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'		" Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
""------------------=== Other ===----------------------
"Plugin 'bling/vim-airline'   	    	" Lean & mean status/tabline for vim
"Plugin 'fisadev/FixedTaskList.vim'  	" Pending tasks list
"Plugin 'rosenfeld/conque-term'      	" Consoles as buffers
"
""Plugin 'docunext/closetag.vim'
"Plugin 'alvan/vim-closetag'
"
""let's you fuzzy search through the files in project (and much more, really)
"Plugin 'junegunn/fzf.vim'
"
""inserts quotes and parenthesis in pairs as you type
"Plugin 'jiangmiao/auto-pairs'
"
""press gcc to comment out a line or gc to comment a selection in visual mode
"Plugin 'tpope/vim-commentary'
"
""YAJS: Yet Another JavaScript Syntax
"Plugin 'othree/yajs.vim'
"


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"  Показывать номера строк
"set number
" Включить подсветку синтаксиса
syntax on
" Поиск в процессе набора
set incsearch
" Подсвечивание результатов поиска
set hlsearch
" умная зависимость от регистра. Детали `:h smartcase`
set ignorecase
set smartcase
" Кодировка текста по умолчанию tf8
set termencoding=utf8
" Включаем несовместимость настроек с Vi, так как Vi нам и не понадобится
set nocompatible
" Показывать положение курсора всё время.
set ruler
" Показывать незавершённые команды в статусбаре
set showcmd
set autoindent
" Не переносить строки
" Преобразование Таба в пробелы
set expandtab
" Размер табуляции по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set showmatch
set wildmenu
filetype plugin on
"set background=dark
"colorscheme evening

let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=23                          " Default is 40, seems too wide
noremap <silent> <Leader>y :TagbarToggle       " Display panel with y (or ,y)

autocmd FileType java set tags+=~/IdeaProjects/javasrc/.tags;

:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
"автоматически обновлять файл при его изменении
set autoread

"  показывать относительные номера строк. Удобно тем, что можно легко переходить к нужной строке командой 10j, например
"set rnu
"  всегда показывать строку статуса
set laststatus=2

"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

"Время, которое vim ждет для ввода следующего символа комбинации клавиш.
"Например, если в vim'e существует комбинация "df", то после ввода символа "d" у вас есть пол секунды,
"чтобы ввести "f", иначе в буфер вставиться символ "d".
set timeoutlen=500

"эту команду я плохо понимаю. В документации написано, что это время ожидания для ввода последовательностей клавиш,
"в таком случае, я не знаю в чем отличие от предыдущей команды. Тем не менее, когда ожидание равно нулю, то при нажатии <Esc>
"для выхода из визуального режима или закрытия всплывающего меню, нет никакой заминки, что весьма приятно.
set ttimeoutlen=0

"более удобная работа с кириллицей. При нажатии <C-6> в режиме вставки, vim изменит режим с "Insert" на "Insert (lang)",
"после чего будут вводиться русские символы. Если вернуться в нормальный режим, то все команды будут работать.
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
"Выставляем кодировку
setlocal nobomb
set encoding=utf-8
set termencoding=utf-8
"// Если в течении этого времени, вы не будете перемещать курсор или печатать, vim обновит swap-файл,
"// а также активирует событие CursorHold. Некоторые плагины, вроде tagbar, слушают это событие для обновления состояния.
"// Так как swap-файлы я не использую, решил сделать значение поменьше (по умолчанию - 4000).
set updatetime=500
":vsplit открывает окна справа
set splitright

"// :split открывает окна снизу
set splitbelow
"// ищем тег-файл в текущей директории
"set tags=./tags;
set hidden
"// количество cтрок в всплывающем окне
set pumheight=10
"// использовать пробелы в качестве разделителей окон. Не забудьте поставить в конце строки символ пробела
"set fillchars+=vert:\ 
"set fillchars+=vert:│

"hi VertSplit ctermbg=NONE guibg=NONE
" Set split separator to Unicode box drawing character
set encoding=utf8
set fillchars=vert:│

" Override color scheme to make split the same color as tmux's default
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

"set tags=~/.tags,~/IdeaProjects/javasrc/tags;/,./tags;/,tags;/,.tags;/
"set tags=~/.tags;/,./tags;/,tags;/,.tags;/
"set tags+=tags;
set tags=~/.tags/,./tags;/,tags;/,.tags;/,~/IdeaProjects/javasrc/tags;/
"set tags=~/.tags;/,./tags;/,tags;/,.tags;/

let mapleader=","
"set makeprg=mvn\ clean\ install
set makeprg=python3\ % 
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
map <Leader>j :make<CR>
"§map <F5> :Make<CR><C-w><Up>
" vertical line indentation
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h19
    elseif has("gui_win32")
        "    set guifont=Consolas:h11:cANSI
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12:cANSI
        "    set guifont=Source\ Code\ Pro:h11:cANSI
        let Powerline_symbols = 'fancy'
    endif
endif
set linespace=2
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow
"" Go to last file(s) if invoked without arguments.
"autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
"    \ call mkdir($HOME . "/.vim") |
"    \ endif |
"    \ execute "mksession! " . $HOME . "/.vim/Session.vim"
"
"autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
"    \ execute "source " . $HOME . "/.vim/Session.vim"

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | NERDTree | endif

nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”)
"&& b:NERDTreeType == “primary”) | q | endif
"
""автопозиционирование на дереве nerdtree
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
if exists('+colorcolumn')
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
    highlight CursorLine ctermbg=235 guibg=#2c2d27
    highlight CursorColumn ctermbg=235 guibg=#2c2d27
    let &colorcolumn=join(range(81,999),",")
else
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
end
"macvim fullscreen mode
if has("gui_macvim")
    set fu
endif

let g:ackprg = 'ag --nogroup --nocolor --column'
" The Silver Searcher
if executable('ag')
 " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:dbext_default_profile_psql = 'type=PGSQL:host=localhost:port=5432:dbname=postgis_test:user=postgres'
"let g:dbext_default_profile_ora = 'type=ORA:host=127.0.0.1:port=1521:srvname=aplcore:user=system:passwd=sberbank'
"let g:dbext_default_profile_ora= 'type=ORA:srvname=//127.0.0.1:1521\aplcore:user=apl_stg:passwd=sberbank'
let g:dbext_default_profile_ora='type=ORA:srvname=(DESCRIPTION = (ADDRESS = (PROTOCOL = TCP)(HOST = 0.0.0.0)(PORT = 1521))     (CONNECT_DATA = (SERVER = DEDICATED)(SERVICE_NAME = aplcore))):user=apl_stg:passwd=sberbank'
let g:dbext_default_profile = 'ora'

"autocmd VimEnter * DBCompleteTables
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
set noswapfile

"" Define the current compiler
"if exists("compiler")
"  finish
"endif
"let compiler = "python"

" Set python as the make program and
"setlocal makeprg=python
"setlocal errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" When writing Python file check the syntax
"au! BufWriteCmd *.py call CheckPythonSyntax()

"function CheckPythonSyntax()
"  " Write the current buffer to a temporary file, check the syntax and
"  " if no syntax errors are found, write the file
"  let curfile = bufname("%")
"  let tmpfile = tempname()
"  silent execute "write! ".tmpfile
"  let output = system("python -c \"__import__('py_compile').compile(r'".tmpfile."')\" 2>&1")
"  if output != ''
"    " Make sure the output specifies the correct filename
"    let output = substitute(output, fnameescape(tmpfile), fnameescape(curfile), "g")
"    echo output
"  else
"    write
"  endif
"  " Delete the temporary file when done
"  call delete(tmpfile)
"endfunction
"let g:pipemysql_login_info = [
"                             \ {
"                             \    'description' : 'peach',
"                             \    'ssh_address' : 'root@persikanlivnoi.ru',
"                             \    'ssh_port' : '',
"                             \    'mysql_hostname' : 'localhost',
"                             \    'mysql_username' : 'root',
"                             \    'mysql_password' : 'peachdb',
"                             \    'mysql_database' : 'peachdb'
"                             \ },
"                             \ {
"                             \    'description' : 'my server 2',
"                             \    'ssh' : 'root@server2',
"                             \    'mysql_hostname' : 'somehostname',
"                             \    'mysql_username' : 'my_username',
"                             \ },
"                             \ {
"                             \    'description' : 'my local',
"                             \    'mysql_hostname' : 'localhost',
"                             \ }
"                           \ ]
autocmd BufNewFile,BufRead *.hub,*.satellite,*.link set syntax=sql
"autocmd BufNewFile,BufRead *.pug set syntax=javascript
"let python_highlight_all = 1
"set cursorline

" на маке vim?
"if has("mac")
"  set guifont=Consolas:h13
"  set fuoptions=maxvert,maxhorz
"endif

""=====================================================
"" Python-mode settings
""=====================================================
"" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1
"
" поддержка virtualenv
let g:pymode_virtualenv = 1

"" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

"" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0

" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

"=====================================================
" User hotkeys
"=====================================================
" ConqueTerm
" запуск интерпретатора на F5
"nnoremap <F5> :ConqueTermSplit ipython<CR>
"" а debug-mode на <F6>
"nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>
"let g:ConqueTerm_StartMessages = 0
"let g:ConqueTerm_CloseOnEnd = 0
"" проверка кода в соответствии с PEP8 через <leader>8
""autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>
"
"" автокомплит через <Ctrl+Space>
"inoremap <C-space> <C-x><C-o>
"
"" переключение между синтаксисами
"nnoremap <leader>Th :set ft=htmljinja<CR>
"nnoremap <leader>Tp :set ft=python<CR>
"nnoremap <leader>Tj :set ft=javascript<CR>
"nnoremap <leader>Tc :set ft=css<CR>
"nnoremap <leader>Td :set ft=django<CR>


"=====================================================
" Languages support
"=====================================================
" --- Python ---
"autocmd FileType python set completeopt-=preview " раскомментируйте, в случае, если не надо, чтобы jedi-vim показывал документацию по методу/классу
"autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
"\ formatoptions+=croq softtabstop=4 smartindent
"\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
"autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

"" --- JavaScript ---
"let javascript_enable_domhtmlcss=1
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"" --- template language support (SGML / XML too) ---
"autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
"autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
"autocmd BufNewFile,BufRead *.mako setlocal ft=mako
"autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
""autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
"let html_no_rendering=1
"let g:closetag_default_xml=1
"let g:sparkupNextMapping='<c-l>'
"autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
"autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

"" --- CSS ---
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" --- c compile ---
" map <F8> : !gcc % && ./a.out <CR>

 " FORMATTERS
"au FileType javascript setlocal formatprg=prettier
"au FileType javascript.jsx setlocal formatprg=prettier
"au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
"au FileType html setlocal formatprg=js-beautify\ --type\ html
"au FileType scss setlocal formatprg=prettier\ --parser\ css
"au FileType css setlocal formatprg=prettier\ --parser\ css

"gq is quite handy as it can be combined with the text objects:
"gqgq format current line
"gqip format paragraph
"gggqG format the whole file
"
"transparent background
hi Normal guibg=NONE ctermbg=NONE
set background=dark
colorscheme hybrid
let g:solarized_termcolors=256

let vim_markdown_preview_github=1
color solarized

nnoremap <leader>ld :LivedownToggle<CR>

:au VimEnter * :GitGutterEnable

"" Automatically save the session when leaving Vim
"autocmd! VimLeave * mksession
"" Automatically load the session when entering vim
"autocmd! VimEnter * source ~/Session.vim

" assuming you want to use snipmate snippet engine
"ActivateAddons vim-snippets snipmate
let g:NERDTreeWinSize=23

"markdown begin
"" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
"markdown end§
