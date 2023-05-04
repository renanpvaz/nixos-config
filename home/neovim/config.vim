
syntax enable
syntax on
colorscheme space-vim-dark
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
filetype plugin on

set termguicolors
set nocompatible
set nowrap
set clipboard+=unnamedplus
set number
set showmatch
set formatoptions+=o
set splitbelow
set splitright
set autochdir
set backupcopy=yes
set autoread

let g:airline_theme='hybridline'
let g:airline#extensions#tabline#enabled = 1
let g:coc_global_extensions = ['coc-tsserver', 'coc-prettier']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:vimwiki_list = [{ 'syntax': 'markdown', 'ext': '.md' }]

let mapleader = ","

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>do <Plug>(coc-codeaction)

nmap <F6> <Plug>(coc-rename)

map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>x :x<CR>
