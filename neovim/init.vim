" My neovim setup

" Configure automatic reload for init.vim
autocmd! BufWritePost ~/.config/nvim/init.vim source %

" Configure <Leader> key
let mapleader = ","
"let mapleader = " "

set hidden

" Configure cut and paste
" set pastetoggle=<F10>
" set clipboard=unnamed

" Configure search highlights
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Configure quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Configure fast quit command
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" Configure move keys
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Configure movement between tabs
map <F4> <ESC>:tabprevious<CR>
map <F5> <ESC>:tabnext<CR>

" Configure sort function
vnoremap <Leader>s :sort<CR>

" Show whitespaces and invisible characters
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" Configure line number and lengths
set bs=2
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233 guibg=#2c2d27

" Configure history and undo
set history=700
set undolevels=700

" Configure tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Disable swap and backup files
set nobackup
set nowritebackup
set noswapfile

" Remove moving with arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Split creation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Setup colorscheme
" colorscheme desert


" PLUGIN MANAGER
call plug#begin('~/.config/nvim/plugged')


" Generic plugins

" plugin manager
Plug 'junegunn/vim-plug'

" fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_max_height = 15
let g:ctrlp_map = '<F2>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg)$'
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz,*.tar,*.bz2,*.pyc

" directory manager
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
map <F1> :NERDTreeToggle<CR>

" code tags
Plug 'majutsushi/tagbar'
nmap <F3> <ESC>:TagbarToggle<CR>
let g:tagbar_left = 1

" undo history
Plug 'mbbill/undotree'
nnoremap <F9> :UndotreeToggle<CR>

" commenting in and out
Plug 'tpope/vim-commentary' " :7,17Commentary, gc

" scratchpad
Plug 'mtth/scratch.vim'
nnoremap <F10> :Scratch<CR>

" autoclose quotes etc.
Plug 'Raimondi/delimitMate'

" statusbar
"Plug 'vim-airline/vim-airline'
Plug 'itchyny/lightline.vim'
set noshowmode

" tabularize
Plug 'godlygeek/tabular' ":Tab /:

" tasklist
Plug 'vim-scripts/TaskList.vim'
map <Leader>v <Plug>TaskList

" syntax checking
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntasti_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ripgrep search
Plug 'jremmen/vim-ripgrep'
let g:rg_highlight = 1
let g:rg_derive_root = 1


" Language specific plugins

" Webdev

"" Emmet
Plug 'mattn/emmet-vim'
" webapi
Plug 'mattn/webapi-vim'


" Golang

" vim-go
Plug 'fatih/vim-go', {'for': 'go'}
autocmd BufRead,BufNewFile Filetype *.go set filetype=go
autocmd FileType go call sacp#enableForThisBuffer({ "matches": [
                \ { '=~': '\v[a-zA-Z]{4}$' , 'feedkeys': "\<C-x>\<C-n>"} ,
                \ { '=~': '\.$'            , 'feedkeys': "\<C-x>\<C-o>", "ignoreCompletionMode":1} ,
                \ ]
                \ })
au Filetype go nmap <Leader>r <Plug>(go-run)
au Filetype go nmap <Leader>b <Plug>(go-build)
au Filetype go nmap <Leader>t <Plug>(go-test)
au Filetype go nmap <Leader>c <Plug>(go-coverage-toggle)
au Filetype go nmap <Leader>l <Plug>(go-metalinter)
au Filetype go nmap <Leader>s <Plug>(go-implements)
au Filetype go nmap <Leader>i <Plug>(go-info)
au Filetype go nmap <Leader>er <Plug>(go-rename)
au Filetype go nmap <Leader>ds <Plug>(go-def-split)
au Filetype go nmap <Leader>dv <Plug>(go-def-vertical)
au Filetype go nmap <Leader>dt <Plug>(go-def-tab)
au Filetype go nmap <Leader>d <Plug>(go-doc-split)
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" New ones
let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 0

Plug 'jodosha/vim-godebug'
au Filetype go nmap <Leader>br :call GoToggleBreakpoint()<CR>
au Filetype go nmap <Leader>db :call GoDebug()<CR>

Plug 'buoto/gotests-vim'

Plug 'roxma/SimpleAutoComplPop'

Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
" TODO: Does nothing atm

" Rust
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1

" vim-racer
Plug 'racer-rust/vim-racer'
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" buffergator
Plug 'jeetsukumaran/vim-buffergator'
nnoremap <F9> :BuffergatorToggle<CR>

" vim-bookmarks https://github.com/MattesGroeger/vim-bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" easymotion
Plug 'easymotion/vim-easymotion'


"""""""
" VCS "
"""""""

" mercurial support
Plug 'jlfwong/vim-mercenary'

" git support
"Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
let g:signify_vcs_list = ['git', 'hg']
let g:signify_realtime = 1
let g:signify_line_highlight = 1
let g:signify_cursorhold_normal = 1
let g:signify_cursorhold_insert = 1
let g:signify_update_on_bufenter = 0
let g:signify_update_on_focusgained = 1

Plug 'tpope/vim-fugitive'

" Filetypes

" markdown
Plug 'plasticboy/vim-markdown'
autocmd BufNewFile,BufReadPost *md set filetype=markdown

" markdown toc
Plug 'mzlogin/vim-markdown-toc'
autocmd BufNewFile,BufReadPost *md set filetype=markdown

" json
Plug 'elzr/vim-json'

" gherkin
Plug 'tpope/vim-cucumber'

" vim indent guides
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 3
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" ansible
Plug 'pearofducks/ansible-vim'

" toml support
Plug 'cespare/vim-toml'

" Minimap
Plug 'severin-lemaignan/vim-minimap'

" VueJS and webdev
Plug 'posva/vim-vue'
autocmd FileType vue syntax sync fromstart

" Unsorted stuff
Plug 'cakebaker/scss-syntax.vim'
Plug 'stephpy/vim-yaml'
Plug 'uarun/vim-protobuf'
Plug 'kylef/apiblueprint.vim'
Plug 'keith/tmux.vim'
Plug 'kurayama/systemd-vim-syntax'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'chr4/nginx.vim'
Plug 'tbastos/vim-lua'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'isobit/vim-caddyfile'
Plug 'ekalinin/Dockerfile.vim'
Plug 'hrj/vim-DrawIt'
Plug 'godlygeek/tabular'

" Themes
Plug 'fatih/molokai'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-gotham'
Plug 'fugalh/desert.vim'
Plug 'mhinz/vim-startify'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme molokai
"colorscheme desert
"colorscheme seoul256
"colorscheme gotham256
"colorscheme gruvbox
set background=dark

filetype plugin indent on
