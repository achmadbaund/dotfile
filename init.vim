"set guifont=Jet\ Brains\ Mono\ Nerd\ Font:h14
set autoread
set background=dark
set mouse=a mousemodel=popup
set backspace=2
set clipboard=unnamedplus
set colorcolumn=+1
set cursorline
set encoding=UTF-8
set expandtab softtabstop=2 shiftwidth=2
set guifont=Jet\ Brains\ Mono\ Nerd\ Font:h12
set hidden
set history=50
set ignorecase
set iskeyword+=\-
set lazyredraw
set linespace=5
set nobackup
set noswapfile
set nowritebackup
set nu rnu
set number relativenumber
set termguicolors
set textwidth=80
set ttyfast

call plug#begin('~/.config/nvim/autoload/plugged')
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-bufferline'
Plug 'easymotion/vim-easymotion'
Plug 'elixir-editors/vim-elixir'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'ghifarit53/tokyonight-vim'
Plug 'janko-m/vim-test'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'neoclide/coc.nvim', { 'merged': 0, 'rev': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'
Plug 'slashmili/alchemist.vim'
Plug 'slim-template/vim-slim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/BufOnly.vim'
call plug#end()

filetype plugin indent on

set termguicolors
"COLORSCHEME
let ayucolor='mirage'
"let g:tokyonight_style='storm'
"let g:lightline = {'colorscheme' : 'tokyonight'}
"let g:airline_theme = 'tokyonight'
"let ayucolor='light'
"colorscheme pencil
"colorscheme miami-night
"colorscheme trial
colorscheme ayu
"colorscheme tokyonight

map <F2> :set paste<CR>i
map <silent> <F3> :call BufferList()<CR>

" Neovide configuration
"let g:neovide_fullscreen=v:true
let g:neovide_cursor_vfx_particle_phase=1.5
let g:neovide_cursor_animation_length=0.1
let g:neovide_cursor_vfx_mode = 'railgun'
"let g:neovide_cursor_antialiasing=v:true

let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_statusline = 1
let loaded_netrwPlugin = 1

hi ColorColumn guibg=#434343 ctermbg=238

let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }

" Coc Default Config
let g:coc_global_extensions = ['coc-css', 'coc-html', 'coc-json',
                             \ 'coc-tsserver', 'coc-yaml',
                             \ 'coc-snippets', 'coc-yank']

let g:coc_snippet_next = '<Down>'
let g:coc_snippet_prev = '<Up>'

" FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Enable enter to complete snippet or confirm autocompletion
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Disable plain arrow keys
" Up and Down is used for snippets
map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>
set whichwrap+=<,>,h,l,[,]

" Resize key binding
map <Left> :vertical resize -5<CR>
map <Right> :vertical resize +5<CR>
map <S-C-j> <Plug>(is-scroll-f)
map <S-C-k> <Plug>(is-scroll-b)
nmap <leader>c :noh<CR>
nmap <C-k> [e
nmap <C-j> ]e
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <C-p> :Files <CR>
nmap <leader>f :Rg <CR>
nmap <leader>b :Buffers <CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Save when insert mode
map <silent> <C-s> :StripWhitespace<CR><ESC> :w<CR>
nmap <silent> <C-s> :StripWhitespace<CR><ESC> :w<CR>
imap <silent> <C-s> <ESC>:StripWhitespace<CR><ESC> :w<CR>

" Open coc yank lis
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nnoremap <M-LeftMouse> <Cmd>set mouse=<Bar>autocmd CursorMoved * ++once set mouse=nv<CR>

" Move window
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

if exists('g:plugs["defx.nvim"]')
  autocmd FileType     defx call s:defx_my_settings()
  autocmd BufWritePost *    call defx#redraw()
  autocmd BufEnter     *    call s:open_defx_if_directory()

  call defx#custom#option('_', {
    \ 'winwidth'           : 40,
    \ 'split'              : 'vertical',
    \ 'direction'          : 'topleft',
    \ 'buffer_name'        : 'defx',
    \ 'columns'            : 'git:indent:icons:filename',
    \ 'show_ignored_files' : 0,
    \ 'toggle'             : 1,
    \ 'resume'             : 1,
    \ 'auto_cd'            : 1,
    \ })

  call defx#custom#column('icon', {
    \ 'directory_icon' : '‚ñ∏',
    \ 'opened_icon'    : '‚ñæ',
    \ })

  call defx#custom#column('filename', {
    \ 'min_width': 40,
    \ 'max_width': 1000,
    \ })

  " Open Defx when open a directory
  function! s:open_defx_if_directory()
    try
      let l:full_path = expand(expand('%:p'))
    catch
      return
    endtry

    if isdirectory(l:full_path)
      execute "Defx `expand('%:p')` | bd " . expand('%:r')
    endif
  endfunction
  nnoremap <C-n> :Defx<CR>
  function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> <CR> defx#is_directory() ? defx#do_action('open_or_close_tree') : defx#do_action('drop')
    nnoremap <silent><buffer><expr> <2-LeftMouse>
    \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> <2-RightMouse>
    \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> V
    \ defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> S
    \ defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> P
    \ defx#do_action('open', 'pedit')
    nnoremap <silent><buffer><expr> o
    \ defx#do_action('open_or_close_tree')
    nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> M
    \ defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> T
    \ defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> !
    \ defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yp
    \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
    \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ;
    \ defx#do_action('repeat')
    nnoremap <silent><buffer><expr> <Backspace>
    \ defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Space>
    \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-r>
    \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
  endfunction

endif

" Define the default higlight color for defx-icons
hi default link DefxIconsMarkIcon         Statement
hi default link DefxIconsCopyIcon         WarningMsg
hi default link DefxIconsMoveIcon         ErrorMsg
hi default link DefxIconsDirectory        Directory
hi default link DefxIconsParentDirectory  Directory
hi default link DefxIconsSymlinkDirectory Directory
hi default link DefxIconsOpenedTreeIcon   Directory
hi default link DefxIconsNestedTreeIcon   Directory
hi default link DefxIconsClosedTreeIcon   Directory

" defx-icons

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length           = 2
let g:defx_icons_directory_icon          = 'dir'
let g:defx_icons_mark_icon               = '#'
let g:defx_icons_copy_icon               = '#'
let g:defx_icons_move_icon               = '#'
let g:defx_icons_parent_icon             = '#'
let g:defx_icons_default_icon            = '#'
let g:defx_icons_directory_symlink_icon  = '#'

" Options below are applicable only when using 'tree' feature
let g:defx_icons_draw_tree_structure     = 1
let g:defx_icons_root_opened_tree_icon   = 'Opened'
let g:defx_icons_nested_opened_tree_icon = '‚ñæ'
let g:defx_icons_nested_closed_tree_icon = '‚ñ∏'

" Define the default higlight color for defx-icons
hi default link DefxIconsMarkIcon         Statement
hi default link DefxIconsCopyIcon         WarningMsg
hi default link DefxIconsMoveIcon         ErrorMsg
hi default link DefxIconsDirectory        Directory
hi default link DefxIconsParentDirectory  Directory
hi default link DefxIconsSymlinkDirectory Directory
hi default link DefxIconsOpenedTreeIcon   Directory
hi default link DefxIconsNestedTreeIcon   Directory
hi default link DefxIconsClosedTreeIcon   Directory

" defx-git

if exists('g:plugs["defx-git"]')
  call defx#custom#column('git', 'column_length', 1)

  call defx#custom#column('git', 'raw_mode', 0)

  call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '+',
  \ 'Untracked' : '*',
  \ 'Renamed'   : 'R',
  \ 'Unmerged'  : '=',
  \ 'Ignored'   : 'i',
  \ 'Deleted'   : 'X',
  \ 'Unknown'   : '?'
  \ })

  hi Defx_git_Untracked ctermfg=214 ctermbg=NONE
  hi Defx_git_Ignored   ctermfg=214 ctermbg=NONE
  hi Defx_git_Unknown   ctermfg=214 ctermbg=NONE
  hi Defx_git_Renamed   ctermfg=214 ctermbg=NONE
  hi Defx_git_Modified  ctermfg=214 ctermbg=NONE
  hi Defx_git_Unmerged  ctermfg=214 ctermbg=NONE
  hi Defx_git_Deleted   ctermfg=214 ctermbg=NONE
  hi Defx_git_Staged    ctermfg=214 ctermbg=NONE
endif


"call defx#custom#column('icon', {
"      \ 'directory_icon': 'Óóø',
"      \ 'opened_icon': 'Óóæ',
"      \ 'root_icon': 'üìÅ',
"      \ })
autocmd BufNewFile,BufRead *.slim setlocal filetype=slim
autocmd BufRead,BufNewFile *.es6 setlocal filetype=javascript

au InsertLeave * set nopaste