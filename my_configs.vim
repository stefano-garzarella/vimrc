
" cscope support
source ~/.vim_runtime/vimrcs/cscope_maps.vim

function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
au BufEnter /* call LoadCscope()

" ctags support
set tags+=./tags;/,tags;/
set tags+=/var/tmp/tags

set foldlevelstart=20

set colorcolumn=80
set textwidth=80
set mouse=a

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

set tabstop=8
set shiftwidth=4
set softtabstop=8
set expandtab
set autoindent
set smartindent
set smarttab
set copyindent
set preserveindent

"freebsd code
"set noexpandtab
"set shiftwidth=8
"
let g:gitgutter_enabled = 1

" YouCompleteMe parameters
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>yd :YcmCompleter GetDoc<CR>
nnoremap <leader>yt :YcmCompleter GetType<CR>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
let g:ycm_autoclose_preview_window_after_completion = 1

filetype plugin indent on

highlight clear SignColumn

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#default#section_truncate_width = {
            \ 'b': 70,
            \ 'c': 60,
            \ 'x': 50,
            \ 'y': 120,
            \ 'z': 45,
            \ 'warning': 100,
            \ }
" auto going to last line
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" usefull only on mac (macvim), other vims block on this,
" then it must be the last line
set nofullscreen

