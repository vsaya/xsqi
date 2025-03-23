" xsaya vimrc

let mapleader = " "

" basic ö re-bindings
noremap j h
noremap k j
noremap l k
noremap ö l

map <leader>j <C-w>h
map <leader>k <C-w>j
map <leader>l <C-w>k
map <leader>ö <C-w>l

noremap gj gh
noremap gk gj
noremap gl gk
noremap gö gl

" switch to last buffer with s instead of ctrl+6
nnoremap s <C-6>

" toggle bindings
nnoremap <leader>tn :set relativenumber!<cr>
nnoremap <leader>tI :set spell!<cr>
nnoremap <leader>ti :setlocal spell! spelllang=en_us
nnoremap <leader>tl :set spelllang=sv
nnoremap <leader>ts :set hlsearch!<cr>
nnoremap <leader>tm :sil !sx 'glow -p %'<cr>
nnoremap <leader>th :set list!<CR>
nnoremap <leader>tw :set wrap!<CR>


" basic settings
syntax on
set display=lastline
set background=dark
set encoding=utf-8
set wildmode=longest,list,full
set tabstop=4 softtabstop=4
set shiftwidth=4
set iskeyword+=-
set expandtab
set smartindent
" helper for indent mistake
set listchars=tab:»»,trail:·
set incsearch
set hidden
set clipboard=unnamedplus
set mouse=a
set number relativenumber
set splitbelow splitright
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.local/share/vim-undodir
set undofile
set cursorline
" set cursorcolumn
set termguicolors
set cmdwinheight=1
" let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
" let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"

" netrw (default binds will be used)
let g:netrw_banner = 0
let g:netrw_liststyle = 1
let g:netrw_sizestyle = "h"

" advanced bindings
" NOTE: 'nore' mappings are only there to prevent recursion
nnoremap <leader>a :let @" = expand('%:p:h')<cr>:e <C-r>"/
nnoremap <leader>w :Explore<cr>
nnoremap <leader>l :let @" = substitute(getcwd(),$HOME,'~','')<cr>:Explore <C-r>"/<cr>
nnoremap <leader>. :let @" = substitute(expand('%:p:h'),$HOME,'~','')<cr>:cd <C-r>"/
nnoremap <leader>: :let @" = substitute(getcwd(),$HOME,'~','')<cr>:cd <C-r>"/
nnoremap <leader>, :buffers<cr>:buffer 
nnoremap <leader>c :let @+ = expand("%:p")<cr>
nnoremap <leader>o :let @a = system('fd -H -E .git . $HOME/dotfiles/ <bar> fzf --height=80\% <bar> tr -d "\n"')<cr>:e <C-r>a<cr>:redraw!<cr>
nnoremap <leader>p :let @a = system('fd -H -E .git . $HOME/core/ <bar> fzf --height=80\% <bar> tr -d "\n"')<cr>:e <C-r>a<cr>:redraw!<cr>
nnoremap <leader>f :let @a = system('fd -H -E .git . <bar> fzf --height=80\% <bar> tr -d "\n"')<cr>:e <C-r>a<cr>:redraw!<cr>
nnoremap <leader>s :!tmux-sessionizer<cr><cr>
nnoremap <leader>r :sil !sx<cr>:redraw!<cr>
nnoremap <leader>x :let @+ = system('sx -y <bar> tr -d "\n"')<cr>:sil !sx ''<left>
nnoremap <leader>X :let @+ = system('sx -y <bar> tr -d "\n"')<cr>:sil !sx set ''<left>
nnoremap <leader>d :s/\[ \]/\[x\]/g<CR>wa <C-r>=strftime('%d-%m-%Y %H:%M')<Esc><Esc>
nnoremap <leader>D :s/\[x.*\] /\[ \] /g<cr>
nnoremap <leader>R :bd<cr>:! bash $HOME/dotfiles/.stow-local-ignore/scripts/xdo-renew-extern<cr>:e $HOME/core/x/notes/xdo.md<cr>
" experimental format bindings
" nnoremap <leader>i :* :vi gq <bar>:* :vi =
nnoremap <leader>i :let save_cursor=getcurpos()<cr>gggqG:call setpos('.', save_cursor)<cr>zz
" TODO: grepping should work better and show up in tmux pane (or redirected to
" a vim buffer)
nnoremap <leader>g :sil !sx 'rg -. '<left>
" nnoremap : q:i " experimental vi mode for command mode
" insert mode advanced bindings
inoremap <C-r>r <C-r>=system(" <bar> tr '\n' ' '")<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
inoremap <C-r>R <C-r>=system("")<left><left>
inoremap <C-g> <C-x><C-f>
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-x><C-f>"

" bracket/symbols bindings
inoremap xxj {<cr>}<Esc>O
inoremap xxä {}<Esc>i
inoremap xxö {}
inoremap xx2ö {{}}<Esc><left>i
inoremap jjj {
inoremap jjö }
inoremap xxi ()<Esc>i
inoremap xx2i (())<Esc><left>i
inoremap xxo ()
inoremap jji (
inoremap jjo )
inoremap xxk []<Esc>i
inoremap xx2k [[]]<Esc><left>i
inoremap xxl []
inoremap jjk [
inoremap jjl ]
inoremap xx, <><Esc>i
inoremap xx2, <<>><Esc><left>i
inoremap xx. <>
inoremap jj, <
inoremap jj. >
inoremap jj \
inoremap jje \
inoremap jjw &
inoremap xxw &&
inoremap jjs %
inoremap jjh ~
inoremap jjc ^
inoremap xxe ''<left>
inoremap xxd ""<left>
inoremap xxp ``<left>
inoremap xxpp ```<cr>```<Esc>O
inoremap jjp `<left>
inoremap jja =
inoremap xxa ==
inoremap xxag >=
inoremap xxal <=
inoremap xxar ->
inoremap xxab <-
inoremap xxga :=
inoremap jjn jj
inoremap xxn xx

cnoremap xxj {}<left>
cnoremap xxä {}<left>
cnoremap xxö {}
cnoremap xx2ö {{}}<left><left>
cnoremap jjj {
cnoremap jjö }
cnoremap xxi ()<left>
cnoremap xx2i (())<left><left>
cnoremap xxo ()
cnoremap jji (
cnoremap jjo )
cnoremap xxk []<left>
cnoremap xx2k [[]]<left><left>
cnoremap xxl []
cnoremap jjk [
cnoremap jjl ]
cnoremap xx, <><left>
cnoremap xx2, <<>><left><left>
cnoremap xx. <>
cnoremap jj, <
cnoremap jj. >
cnoremap jj \
cnoremap jje \
cnoremap jjw &
cnoremap xxw &&
cnoremap jjs %
cnoremap jjh ~
cnoremap jjc ^
cnoremap xxe ''<left>
cnoremap xxd ""<left>
cnoremap xxp ``<left>
cnoremap xxpp ``````<left><left><left>
cnoremap jjp `<left>
cnoremap jja =
cnoremap xxa ==
cnoremap xxag >=
cnoremap xxal <=
cnoremap xxar ->
cnoremap xxab <-
cnoremap xxga :=
cnoremap jjn jj
cnoremap xxn xx

nnoremap -j {
nnoremap -ö }
nnoremap -i (
nnoremap -o )
nnoremap -k [
nnoremap -l ]
nnoremap -, <
nnoremap -. >
nnoremap -e \
nnoremap -w &
nnoremap -s %
nnoremap -h ~
nnoremap -c ^
nnoremap -- -
nnoremap -a ==

" f+F -> find symbols forward
nnoremap f-j f{
nnoremap f-ö f}
nnoremap f-i f(
nnoremap f-o f)
nnoremap f-k f[
nnoremap f-l f]
nnoremap f-, f<
nnoremap f-. f>
nnoremap f-e f\
nnoremap f-w f&
nnoremap f-s f%
nnoremap f-h f~
nnoremap f-c f^
nnoremap f-- f-
nnoremap f-a f=

nnoremap F-j F{
nnoremap F-ö F}
nnoremap F-i F(
nnoremap F-o F)
nnoremap F-k F[
nnoremap F-l F]
nnoremap F-, F<
nnoremap F-. F>
nnoremap F-e F\
nnoremap F-w F&
nnoremap F-s F%
nnoremap F-h F~
nnoremap F-c F^
nnoremap F-- F-
nnoremap F-a F=

xnoremap f-j f{
xnoremap f-ö f}
xnoremap f-i f(
xnoremap f-o f)
xnoremap f-k f[
xnoremap f-l f]
xnoremap f-, f<
xnoremap f-. f>
xnoremap f-e f\
xnoremap f-w f&
xnoremap f-s f%
xnoremap f-h f~
xnoremap f-c f^
xnoremap f-- f-
xnoremap f-a f=

xnoremap F-j F{
xnoremap F-ö F}
xnoremap F-i F(
xnoremap F-o F)
xnoremap F-k F[
xnoremap F-l F]
xnoremap F-, F<
xnoremap F-. F>
xnoremap F-e F\
xnoremap F-w F&
xnoremap F-s F%
xnoremap F-h F~
xnoremap F-c F^
xnoremap F-- F-
xnoremap F-a F=

xnoremap -j {
xnoremap -ö }
xnoremap -i (
xnoremap -o )
xnoremap -k [
xnoremap -l ]
xnoremap -, <
xnoremap -. >
xnoremap -e \
xnoremap -w &
xnoremap -s %
xnoremap -h ~
xnoremap -c ^
xnoremap -- -
xnoremap -a =

inoremap xx<Space> <right>
inoremap xx<Space>j <right> {<cr>}<Esc>O
cnoremap xx<Space> <right>
inoremap xxh <left>
cnoremap xxh <left>

nnoremap <C-s> :w<CR>
" inoremap zz <C-O>zz

" select lines without grabbing <cr> 
xnoremap il g_o0
onoremap il :normal vil<CR>
xnoremap al $o0
onoremap al :normal val<CR>

" cursor settings (incl. changing color in insert mode)
" NOTE: guicursor is for gvim only
augroup myCmds
au!
" set cursor to block
autocmd VimEnter * silent !echo -ne "\e[2 q"
" prevent weird escape sequence on startup from the cursor change
autocmd VimEnter * :normal :startinsert :stopinsert
augroup END

let &t_SI = "\<Esc>]12;#1eba3c\x7"
let &t_EI = "\<Esc>]12;white\x7"
" silent !echo -ne "\033]12;white\007"
" reset cursor when vim exits
" autocmd VimLeave * silent !echo -ne "\033]112\007"
" use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21


" formatters
if executable('shfmt')
    augroup myFormatters
        au!
        autocmd BufNewFile,BufRead * setlocal formatprg=shfmt\ -i\ 4
        autocmd BufNewFile,BufRead *.md setlocal formatprg=
    augroup END
endif

" distraction free editing
" NOTE: :set tw=9999 and gggqG if the text needs to be widened again
"           (setting textwidth to such a high number 'reverses' the narrowing effect of gq)
let s:hidden_all=0
function! ToggleHideAll() abort
    if s:hidden_all==0
        let s:hidden_all=1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
        set numberwidth=20
        hi EndOfBuffer guifg=#110e10 guibg=#110e10
    else
        let s:hidden_all=0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
        " set textwidth=0 " lets not mess with textwidth here
        set numberwidth=4
        hi EndOfBuffer guifg=#ffffff guibg=#110e10
    endif
endfunction

augroup auFileTypes
  autocmd!
  autocmd FileType markdown setlocal textwidth=60
augroup end

nnoremap <silent> <Leader>tg :call ToggleHideAll()<CR>

" show cursorline only in active window
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" theme settings
" first reset all highlights
function! GetLinkTarget(group)
    let groupID = hlID(a:group)
    " Get the group this highlight group links to
    let linkedGroupID = synIDtrans(groupID)
    let linkedGroupName = synIDattr(linkedGroupID, 'name')
    return linkedGroupName
endfunction
for highlightGroupItem in getcompletion('', 'highlight')

    " Get the group this highlight group links to
    let linkedGroup = GetLinkTarget(highlightGroupItem)
    " Only set the root highlight groups (those that don't link to others).
    " This leaves links intact
    if highlightGroupItem ==# linkedGroup
        execute "hi " . highlightGroupItem . " ctermfg=7 ctermbg=none guifg=White guibg=#110e10"
    endif
endfor

" color settings (quiet souls theme for vim)
hi Normal ctermfg=12 ctermbg=8 guifg=#ffffff guibg=#110e10
hi Comment ctermfg=14 guifg=#a9a6a6

" generic syntax groups
hi Statement guibg=#110e10
hi Statement guifg=#78dba1
hi Type guibg=#110e10
hi Type guifg=#78dba1
hi PreProc guibg=#110e10
hi PreProc guifg=#78dba1
hi Constant term=underdotted cterm=underline gui=underdotted guibg=#110e10
hi Title cterm=underline
hi Identifier cterm=none

" language specific syntax groups
"                               v

" general groups
hi CursorLineNr cterm=none ctermbg=8 guifg=#ffffff guibg=#110e10
hi LineNrAbove guifg=#a9a6a6 guibg=#110e10
hi LineNrBelow guifg=#a9a6a6 guibg=#110e10
hi signColumn guibg=#110e10

hi CursorLine cterm=none ctermfg=NONE guifg=NONE guibg=#1a1a1a
hi CursorColumn ctermbg=235 guibg=#110e10
hi StatusLine ctermfg=8 ctermbg=7 guifg=#292929 guibg=#ffffff
hi StatusLineNC ctermfg=236 ctermbg=8 guifg=#1c1c1c guibg=#ffffff
hi VertSplit ctermfg=236 ctermbg=8 guifg=#110e10 guibg=#ffffff
hi MatchParen guifg=#e40509 guibg=#110e10

hi Pmenu ctermfg=243 ctermbg=8 guifg=#ffffff guibg=#211c1f
hi PmenuSbar ctermbg=8 guibg=#211c1f
hi PmenuThumb ctermbg=8 guibg=#505050
hi PmenuSel ctermfg=12 ctermbg=8 guifg=#78dba1 guibg=#505050

hi Directory guifg=#ffffff guibg=#110e10
hi netrwClassify guifg=#ffffff guibg=#110e10
hi NERDTreeFile ctermbg=8 guibg=#211c1f

hi vimHiGroup guifg=#ffffff
hi EndOfBuffer guifg=#ffffff guibg=#110e10
hi ModeMsg guifg=#98EA38 guibg=#110e10
hi Visual guifg=#ffffff guibg=#006600
hi VisualNOS guifg=#ffffff guibg=#006600
hi markdownUrl guifg=#f4ffcc guibg=#110e10

" spelling & highlighting
hi SpellBad cterm=undercurl gui=undercurl guisp=#ff0000 guifg=#ff0000 guibg=#110e10
hi SpellRare guifg=purple guibg=bg
hi SpellCap guifg=yellow guibg=bg
" hi SpellLocal guifg=blue guibg=bg " duplicate word recognized in region
hi Search guifg=orange guibg=bg " this is the most recent search pattern (hlsearch)
hi CurSearch guifg=orange guibg=bg

" Output the current syntax group
nnoremap <f4> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

" status line
set laststatus=2
set statusline=
"set statusline+=%#Comment#
set statusline+=\ %M " modified
set statusline+=\ >>
"set statusline+=%*
"set statusline+= " icon (difficult in URxvt)
set statusline+=\ %F  " full file Path
set statusline+=\ %h " help file
set statusline+=\ %y " file type
set statusline+=\ %r " read only file
set statusline +=%= " from the right <
set statusline+=\[%{fnamemodify(getcwd(),':t')}\]\ \ 
"set statusline+=%!system('pwd | xargs basename') substitute(getcwd(),$HOME,'~','')\ \ 
set statusline+=%{wordcount().words}\w
set statusline+=\ %p%%
set statusline+=\ %l/%L


" LSP setup, the simple way
" mkdir -p ~/.vim/pack/vendor/start && git clone https://github.com/prabirshrestha/vim-lsp.git  ~/.vim/pack/vendor/start/vim-lsp
" install the lsp binaries needed:
" sudo pacman -S typescript-language-server bash-language-server
let g:lsp_diagnostics_enabled = 0
if executable('bash-language-server')
  augroup LspBash
    autocmd!
    autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'bash-language-server',
          \ 'cmd': {server_info->[&shell, &shellcmdflag, 'bash-language-server start']},
          \ 'allowlist': ['sh'],
          \ })
  augroup END
endif
if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-remote=auto']},
        \ 'allowlist': ['go', 'gomod', 'gohtmltmpl', 'gotexttmpl'],
        \ })
    autocmd BufWritePre *.go
        \ call execute('LspDocumentFormatSync') |
        \ call execute('LspCodeActionSync source.organizeImports')
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=no
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> L <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
