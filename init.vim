" Global settings
set showcmd
set confirm
set noswapfile
set t_ut=""
set t_Co=256


" Misc editor tings
set number
:filetype plugin indent on
set nofoldenable
set foldmethod=syntax
set hlsearch
set backspace=indent,eol,start
set noshowmode
set noshowcmd
set shortmess+=F
set regexpengine=1


" Set in this order: we get non-case sensitive search unless we include a capital letter(s).
set ignorecase
set smartcase
set splitright
set linebreak


" Indentation and spacing
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4



" === Plugins ===
call plug#begin('~/.config/nvim/plugged')
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lifepillar/vim-mucomplete'

" colorsss
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim', {'name': 'dracula'}


" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh'
    \ }
Plug 'junegunn/fzf'
Plug 'ziglang/zig.vim'

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()


" Colors
colo seoul256
highlight Search ctermbg=Yellow
highlight Search ctermfg=Black
highlight MatchParen ctermbg=Yellow
highlight MatchParen ctermfg=Black


" Airline
" let g:airline_section_x = ''
" let g:airline_section_y = ''
" let g:airline_skip_empty_sections = 1



" LanguageClient
set runtimepath+=~/.vim/plugged/LanguageClient-neovim
" let g:LanguageClient_serverCommands = {
"     \ 'cpp': ['$CCLS_PATH'],
"     \ 'c': ['$CCLS_PATH'],
"     \ 'zig': ['~/.config/zls/zig-out/bin/zls'],
"     \ 'python': ['$PYLS_PATH'],
"     \}
let g:LanguageClient_serverCommands = {
            \ 'rust': ["~/.cargo/bin/rls"],
            \ 'python': ["~/Library/Python/3.8/bin/pyls"],
            \}
let g:LanguageClient_autoStart = 1
nnoremap <silent> <S-h> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_definition({'gotoCmd': 'split'})<CR>
nnoremap <silent> gv :call LanguageClient#textDocument_definition({'gotoCmd': 'vsplit'})<CR>
set completeopt+=menuone,longest,noselect
set completeopt-=preview
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup=1
let g:mucomplete#completion_delay=1



" CPP Enhanced Highlight
let g:cpp_class_scope_highlight = 0
let g:cpp_member_variable_highlight = 0
let g:cpp_class_decl_highlight = 1



" Rust
let g:rustfmt_autosave = 1



" Clang Format
" let g:clang_format#code_style = "LLVM"
" let g:clang_format#auto_format = 1


" key mappings
let mapleader = "\<Space>"
:imap <silent> <D-a> <C-o>b
:imap <silent> <D-s> <C-o>j
:imap <silent> <D-d> <C-o>e
:imap <silent> <D-w> <C-o>k
:nmap ; :
:imap jk <Esc>
:vnoremap <C-c> "*y
:vnoremap <C-v> "*v
:nnoremap gh :A<CR>
:nmap <C-p> :ProjectBrowseCached<CR>
:nmap <C-P> :ProjectBrowse ~/dev/source/autotrader<CR>
:nnoremap * *''

:command RemoveTrailingWhiteSpace :%s/\s\+$//e

" Window navigation
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-l> :wincmd l<CR>

" Display fullpath of current file
:nmap <silent> <C-f> :echo expand('%:p:h')<CR>
:tnoremap <Esc> <C-\><C-n>
