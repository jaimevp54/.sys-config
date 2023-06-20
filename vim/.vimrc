" Jaime ViÂ¤as .vimrc

" Get this out of your brain <(~_~)> ---------------------- {{{

" }}}
" Plugins (>+_+)> ---------------------- {{{

" Enter Vundle Required stuff ---------------------- {{{
set nocompatible
filetype off
" Required stuff for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
" }}}

" General ---------------------- {{{
Plugin 'Townk/vim-autoclose'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'esalter-va/vim-checklist'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/Pydiction'
Plugin 'wesQ3/vim-windowswap' " Do I really need this?
Plugin 'dyng/ctrlsf.vim' 
Plugin 'mattn/emmet-vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'amadeus/vim-convert-color-to'
Plugin 'doums/darcula'
Plugin 'yamatsum/nvim-cursorline'



" }}}
" Kotlin support {{{
    Plugin 'udalov/kotlin-vim'
"}}}
" Javascript support ---------------------- {{{
Plugin 'posva/vim-vue'
" }}}
" Cisco support {{{
    Plugin 'momota/cisco.vim'
"}}}
" Ember support {{{
    Plugin 'joukevandermaas/vim-ember-hbs'
"}}}
" Elixir support {{{
    Plugin 'elixir-editors/vim-elixir'
    Plugin 'slashmili/alchemist.vim'
"}}}
" Markdown support {{{
    Plugin 'jtratner/vim-flavored-markdown'
"}}}
" CoffeScript support {{{
    Plugin 'kchmck/vim-coffee-script'
"}}}
" Slim support {{{
    Plugin 'slim-template/vim-slim.git'
"}}}
" Python support {{{
    Plugin 'nvie/vim-flake8'

"}}}


" Exit Vundle Required stuff ---------------------- {{{
" enable matchit plugin which ships with vim and greatly enhances '%'
runtime macros/matchit.vim

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" }}}
" Config \(*_*)/ ---------------------- {{{

    " General \(*_*)/ ---------------------- {{{

    let mapleader=','
    let maplocalleader='\\'

    " Do not loop when searching patterns on the file
    set nowrapscan

    " Listen for external changes.
    set autoread
    " Auto-reload when .vimrc is updated
    autocmd! bufwritepost .vimrc source % 

    " Better copy & paste	
    set clipboard=unnamed " Allow me to paste stuff from outside vim.

    " bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
    " Every unnecessary keystroke that can be saved is good for your health :)
    noremap <c-j> <c-w>j
    noremap <c-k> <c-w>k
    noremap <c-l> <c-w>l
    noremap <c-h> <c-w>h

    " bind Alt+<movement> keys to move around tabs.
    noremap <A-h> :tabp
    noremap <A-l> :tabn


    " it's worth to do some stuff just like you do them outside of vim.
    nnoremap <c-w> :q<CR>
    nnoremap <leader><c-w> :q!<CR>
    nnoremap <c-z> :w<CR>

    " easier moving between tabs
    noremap <c-n> <esc>:tabprevious<CR>
    noremap <c-m> <esc>:tabnext<CR>

    " easier moving of code blocks
    vnoremap < <gv  
    vnoremap > >gv 

    set lazyredraw

    " Don't try to highlight lines longer than 800 characters.
    set synmaxcol=800

    " Make sure Vim returns to the same line when you reopen a file.
    " Thanks, Amit
    augroup line_return
        au!
        au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     execute 'normal! g`"zvzz' |
            \ endif
    augroup END

    set noswapfile
    set nobackup

    " Ignore compiled files 
    set wildignore=*.o,*~,*.pyc

    " }}}
    " vim-airline (Plugin) ($_$)---------------------- {{{
        let g:airline#extensions#branch#enabled = 0
    " }}}
    " Ctrlsf(Plugin) (^_^)---------------------- {{{
        nnoremap <C-F><space> :CtrlSF<space>
        nnoremap <C-F>o :CtrlSFOpen<CR>
        nnoremap <C-F>t :CtrlSFToggle<CR>
        inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
    
    " }}}
    " CTRL-P(Plugin) ($_$)---------------------- {{{

    let g:ctrlp_custom_ignore = 'htmlconv'
    
    " }}}
    " Pydiction(Plugin) ($_$)---------------------- {{{

    let g:pydiction_location = '~/.vim/Bundle/Pydiction/complete-dict'
    
    " }}}
    " NERDTree(Plugin) ($_$)---------------------- {{{
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeDirArrowExpandable = '⏵'
    let g:NERDTreeDirArrowCollapsible = '⏷'
    "
    " File highlighting
    function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
    endfunction

    call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
    call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('html', 'green', 'none', 'green', '#151515')
    call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
    call NERDTreeHighlightFile('css', 'yellow', 'none', 'yellow', '#151515')
    call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
    call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
    call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
    " }}}
    " Vim-Emmet ($_$)---------------------- {{{
        imap <c-f> <c-y>,
    " }}}
    " (Plugin) ($_$)---------------------- {{{
        nnoremap <leader>/ :nohlsearch<CR>
    " }}}
" }}}
" Aesthetics (｡◕‿◕｡)---------------------- {{{

colorscheme darcula
set cursorline " highlight line with the cursor on it
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Status line
" TODO: remove 'trailing' area in status bar (or learn what it does)

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set noshowmode
set wildmenu

"Silence is beauty
set visualbell
set noerrorbells

nnoremap ii <ESC>
inoremap ii <ESC>
vnoremap ii <ESC>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Just highlight the active buffer.
augroup cline
    au!
    au WinLeave * set nocursorline
    au WinEnter * set cursorline
augroup END

" }}}
" Mappings (>￣³￣)>---------------------- {{{

nnoremap <leader>dp Ofrom pprint import pprint as pp; import pdb;pdb.set_trace()<ESC>
nnoremap <leader>dt Ofrom pprint import pprint as pp; import nose.tools; nose.tools.set_trace()<ESC>
" Quickly open .vimrc
nnoremap <leader>VE <C-w>v<C-l>:e ~/.sys-config/vim/.vimrc<cr> 
nnoremap <leader>VN <C-w>v<C-l>:e ~/.sys-config/vim/notes.txt<cr> 

nnoremap <leader>/ :nohlsearch<CR>

set timeoutlen=500

 "join line previous line "TODO: implement this in a more clear way " 
nnoremap K :move<space>.-2<cr>:join<cr>


" Easy folding
nnoremap <space> za
nnoremap <leader><space> zM
" Windows Management
set splitright
set splitbelow
nnoremap <leader>sv <C-w>v<C-w>l
nnoremap <leader>sh <C-w>s<C-w>j
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Auto resize Vim splits to active split
set winwidth=84
set winminwidth=20
set winheight=10
set winminheight=10
set winheight=999

" Yank to end of line
nnoremap Y y$

" Reselect last-pasted text
nnoremap gv `[v`]

" Select entire buffer
nnoremap vaa ggVG 
" Delete entire buffer
nnoremap daa ggdG 
" Yank entire buffer
nnoremap yaa myggyG`y 

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Visual like this makes more sense.
nnoremap vv V
nnoremap V <c-v>g_

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz
nnoremap <c-o> <c-o>zz

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_
inoremap <c-h> <esc>I
inoremap <c-l> <esc>A

" Word case TOGGLE
inoremap <c-u> <esc>viwui
inoremap <c-U> <esc>viwUi

" NerdTree 
nnoremap <leader>n :NERDTreeToggle<cr>

" Checklist mappings
nnoremap <space><space> :ChecklistToggleCheckbox<cr>
vnoremap <space><space> :ChecklistToggleCheckbox<cr>
" Permanent Magic search
nnoremap / /\v
vnoremap / /\v
" }}}
" Language Specific (•_•)---------------------- {{{

    " Python---------------------- {{{

    command! PythonRun :w !clear;python

    augroup filetype_py
        autocmd!
        autocmd FileType python nnoremap <buffer> <space> zA
        autocmd FileType python setlocal foldmethod=indent
        autocmd FileType python setlocal foldlevel=99
    augroup END

    " }}}
    " Vimscript file settings ---------------------- {{{
     
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldlevel=0
        autocmd FileType vim setlocal foldmethod=marker

        " add a new fold section by copying the one defined below the mapping.         
        autocmd FileType vim let @z= "/{{{ \" }}}:nohlsearchHyLPF\"iiid^dhkt-i"
        "  ---------------------- {{{ " }}}

    augroup END
            
    " }}}
    " Python config ---------------------- {{{
    augroup filetype_python
        autocmd FileType python abbr debugger import pdb; pdb.set_trace()
    augroup END
    " }}}
    " Cisco config ---------------------- {{{
    augroup filetype_cisco
        autocmd!
        autocmd FileType cisco setlocal foldlevel=0
        autocmd FileType cisco setlocal foldmethod=marker

        autocmd FileType cisco abbr m30	255.255.255.252
        autocmd FileType cisco abbr m29	255.255.255.248
        autocmd FileType cisco abbr m28	255.255.255.240
        autocmd FileType cisco abbr m27	255.255.255.224
        autocmd FileType cisco abbr m26	255.255.255.192
        autocmd FileType cisco abbr m25	255.255.255.128
        autocmd FileType cisco abbr m24	255.255.255.0
        autocmd FileType cisco abbr m23	255.255.254.0
        autocmd FileType cisco abbr m22	255.255.252.0
        autocmd FileType cisco abbr m21	255.255.248.0
        autocmd FileType cisco abbr m20	255.255.240.0
        autocmd FileType cisco abbr m19	255.255.224.0
        autocmd FileType cisco abbr m18	255.255.192.0
        autocmd FileType cisco abbr m17	255.255.128.0
        autocmd FileType cisco abbr m16	255.255.0.0
        autocmd FileType cisco abbr m15	255.254.0.0
        autocmd FileType cisco abbr m14	255.252.0.0
        autocmd FileType cisco abbr m13	255.248.0.0
        autocmd FileType cisco abbr m12	255.240.0.0
        autocmd FileType cisco abbr m11	255.224.0.0
        autocmd FileType cisco abbr m10	255.192.0.0
        autocmd FileType cisco abbr m9	255.128.0.0
        autocmd FileType cisco abbr m8	255.0.0.0
        autocmd FileType cisco abbr m0	0.0.0.0

        autocmd FileType cisco abbr w30	0.0.0.3
        autocmd FileType cisco abbr w29	0.0.0.7
        autocmd FileType cisco abbr w28	0.0.0.15
        autocmd FileType cisco abbr w27	0.0.0.31
        autocmd FileType cisco abbr w26	0.0.0.63
        autocmd FileType cisco abbr w25	0.0.0.127
        autocmd FileType cisco abbr w24	0.0.0.255
        autocmd FileType cisco abbr w23	0.0.1.255
        autocmd FileType cisco abbr w22	0.0.3.255
        autocmd FileType cisco abbr w21	0.0.7.255
        autocmd FileType cisco abbr w20	0.0.15.255
        autocmd FileType cisco abbr w19	0.0.32.255
        autocmd FileType cisco abbr w18	0.0.63.255
        autocmd FileType cisco abbr w17	0.0.127.255
        autocmd FileType cisco abbr w16	0.0.255.255
        autocmd FileType cisco abbr w15	0.1.255.255
        autocmd FileType cisco abbr w14	0.3.255.255
        autocmd FileType cisco abbr w13	0.7.255.255
        autocmd FileType cisco abbr w12	0.15.255.255
        autocmd FileType cisco abbr w11	0.31.255.255
        autocmd FileType cisco abbr w10	0.63.255.255
        autocmd FileType cisco abbr w9	0.127.255.255
        autocmd FileType cisco abbr w8	0.255.255.255
        autocmd FileType cisco abbr w0	255.255.255.255
    augroup END
    " }}}
    " Markdown ---------------------- {{{
    augroup filetype_md
        autocmd!
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal spell
    augroup END
    " }}}
    " HTML ---------------------- {{{
    augroup filetype_md
        autocmd!
        autocmd FileType markdown setlocal wrap
        autocmd FileType markdown setlocal spell
    augroup END
    " }}}
" }}}
" Functions  ( •_•)>⌐■-■  {{{

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" }}}
" Abbreviations (⌐■_■) -------------------------------------------- {{{

iabbrev @@ jaimevp54@gmail.com

" }}}
" Just Maybe (¬_¬) ---------------------- {{{

" "Auto change directory to match current file ,cd
" nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
" Instant Python constructors

" }}}
" STUFF I WANT (^_^) ---------------------- {{{

" }}}

imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true


" let g:ale_python_flake8_options = '--max-line-length=130'
