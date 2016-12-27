" My neovim setup

" Configure automatic reload for init.vim
autocmd! BufWritePost ~/.config/nvim/init.vim source %

" Configure <Leader>
let mapleader = ","

" Configure cut and paste
set pastetoggle=<F10>
set clipboard=unnamed

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
map <Leader>n <ESC>:tabprevious<CR>
map <Leader>m <ESC>:tabnext<CR>

" Configure sort function
vnoremap <Leader>s :sort<CR>

" Show whitespaces and invisible characters
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set list

" Configure line numbers and lengths
"syntax on
set bs=2
set number
set tw=79
set nowrap
set fo-=t
set colorcolumn=80
highlight ColorColumn ctermbg=233

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

" Remove moving with arrows
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

" Setup colorschemes
colorscheme desert

" Call plugin manager vim-plug
call plug#begin('~/.config/nvim/plugged')

" Generic:plugin manager
Plug 'junegunn/vim-plug'

" Generic:fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_max_height = 30
let g:ctrlp_map = '<F3>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg)$'
let g:ctrlp_user_command = 'find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc


" Generic:directory manager
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" TODO: add nerdtree options here

" Generic:code tags
Plug 'majutsushi/tagbar'
map <F2> <ESC>:TagbarToggle<CR>
let g:tagbar_left = 1


" Setup plugins for Go development
Plug 'fatih/vim-go', { 'for': 'go' }
autocmd BufRead,BufNewFile Filetype *.go set filetype=go
au Filetype go nmap <Leader>r <Plug>(go-run)
au Filetype go nmap <Leader>b <Plug>(go-build)
au Filetype go nmap <Leader>t <Plug>(go-test)
au Filetype go nmap <Leader>c <Plug>(go-coverage)
au Filetype go nmap <Leader>l <Plug>(go-metalinter)
au Filetype go nmap <Leader>s <Plug>(go-implements)
au Filetype go nmap <Leader>i <Plug>(go-info)
au Filetype go nmap <Leader>e <Plug>(go-rename)
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" TODO: Setup <Leader> for ctrl x ctrl o
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" vim-go-extra
Plug 'vim-jp/vim-go-extra'

" Rustlang
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1
let g:rustfmt_fail_silently = 1

" tasklist.vim
Plug 'vim-scripts/TaskList.vim'


" Version control
" Git
Plug 'tpope/vim-fugitive'

" Syntax checking - generic
Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" mbbill/undotree - Undo history
Plug 'mbbill/undotree'
nnoremap <F1> :UndotreeToggle<CR>

" tpope/vim-commentary - Commenting plugin
Plug 'tpope/vim-commentary'

" mtth/scratch - vim scratch pad :Scratch TODO: Setup <Leader> cmd for this
Plug 'mtth/scratch.vim'
nnoremap <F10> :Scratch<CR>

" Raimondi/delimitMate - insert closing tags automatically
Plug 'Raimondi/delimitMate'

" Powerline statusbar
Plug 'powerline/powerline'


" Filetypes

" Filetype:markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Filetype:json
Plug 'elzr/vim-json'

" Filetype:ruby
Plug 'vim-ruby/vim-ruby'

" Filetype:ansible
Plug 'pearofducks/ansible-vim'

" UI treats
Plug 'fugalh/desert.vim'

" vim indenting visual guides
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
hi IndentGuidesOdd guibg=red ctermbg=3
hi IndentGuidesEven guibg=green ctermbg=4

" Themes
Plug 'morhetz/gruvbox'

call plug#end()

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme gruvbox
set background=dark

filetype plugin indent on
