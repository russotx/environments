" cursor shape for different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"=======================================================================
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
      
" ====================================================
"              -----  PLUGINS  -----
" ====================================================
" Auto-install vim-plug plugins if they don't exist
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall  --sync | source $MYVIMRC
endif
" ******** BEGIN PLUGS TO INSTALL *********
call plug#begin('~/.vim/plugged')

" Good default settings
Plug 'tpope/vim-sensible'
" ..................UI ENHANCEMENT....................
" Atom color scheme | https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'
" Solarized color scheme | http://vimawesome.com/plugin/vim-colors-solarized-ours
Plug 'altercation/vim-colors-solarized'
" Indent guides
Plug 'nathanaelkane/vim-indent-guides'
" Goyo - distraction free writing | https://github.com/junegunn/goyo.vim
Plug 'junegunn/goyo.vim'
" NERDTree + load on-demand | https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
" Git plugin for NERDTree | https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Font Icons for NERDTree
Plug 'ryanoasis/nerd-fonts'
" Dev Icons
Plug 'ryanoasis/vim-devicons'
" HTML tag highlighting
Plug 'gregsexton/matchtag'
" Airline Custom statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ...................SYNTAX SUPPORT...................
" Syntastic- tons of syntax support
Plug 'scrooloose/syntastic'
" HTML5 syntax and completion
Plug 'othree/html5.vim'
" Javascript syntax and completion
Plug 'pangloss/vim-javascript'
" JSX syntax support | https://github.com/mxw/vim-jsx
Plug 'mxw/vim-jsx'
" JSON syntax and error reporting
Plug 'elzr/vim-json'
" Markdown syntax support
Plug 'plasticboy/vim-markdown'
" Preview CSS colors inline
Plug 'ap/vim-css-color'
" ....................MISC UTILITIES.................
" Tern code completion engine
Plug 'marijnh/tern_for_vim'
" Code completion | https://github.com/valloric/youcompleteme
Plug 'valloric/youcompleteme'
" CTRLP easy file search, etc | https://github.com/ctrlpvim/ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'
" easy comment out blocks of code  with \cc | https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'
" Git wrapper | https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
" auto close various code tags | http://vimawesome.com/plugin/autoclose
Plug 'townk/vim-autoclose'
" Tag Bar for easy view code tags | https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar'
" Auto update tags file for various file types | https://github.com/xolox/vim-easytags
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
" Jump around a file | https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
" Sublime Text style Multi-cursor
Plug 'terryma/vim-multiple-cursors'
call plug#end()
" ********** END PLUGS TO INSTALL *********
"............................................................ 
"============================================================


"============================================================
"       ------  NEW KEY MAPPINGS  -------- 
"============================================================
" .......... MIN DELAY EXITING INSERT MODE ..........
set timeoutlen=1000 ttimeoutlen=5
" .......... LEADER KEY REMAP .........
let mapleader = " "
" Soft CAPS LOCK | Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor
" Kill the CAPSLOCK when leaving insert mode.
autocmd InsertLeave * set iminsert=0
"Goyo mode
map <F10> :Goyo<CR>
" Open NERDtree shortcut -  and  F3 for open to current file highlighted
silent! nmap <Leader>ne :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
" Open NERDTree on current file \v
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let g:NERDTreeMapPreview = "<F4>"
let g:NERDTreeMapActiveNode = "<F3>"
" change split screen nav from <C-w>j to just ctrl+j etc...
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" tab navigation
nnoremap <Leader><Tab> :tabnext<CR>
" ~~mapping the leader key in insert mode causes a delay for normal use~~ inoremap <Leader><Tab> <Esc>:tabnext<CR>i
nnoremap <Leader><S-Tab> :tabprevious<CR>
" inoremap <Leader><S-Tab> <Esc>:tabnext<CR>i
" Syntastic Shortcuts= show location list | next error | prev error | toggle live lint
nnoremap <Leader>er :Errors<CR> 
nnoremap <Leader>en :lnext<CR>
nnoremap <Leader>ep :lprevious<CR>
nnoremap <Leader>st :SyntasticToggleMode<CR>


" ===============================================
"        ------  UI CUSTOMIZATIONS  ------
" ===============================================
" Colors...
colorscheme onedark
" Splits...
set splitbelow
set splitright
" NERDTree...
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let g:nerdtree_tabs_open_on_gui_startup = 2
let g:nerdtree_tabs_open_on_console_startup = 2
let g:nerdtree_tabs_startup_cd = 0
let g:nerdtree_tabs_open_on_new_tab = 1
" Line numbers
set number
" set the width of line number margin
set nuw=1
" .jsx not required to recognize jsx syntax
let g:jsx_ext_required = 0
" no word wrapping
set formatoptions-=t
set nowrap
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
 "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
 "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
 if (empty($TMUX))
   if (has("nvim"))
     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
   endif
   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
   if (has("termguicolors"))
     set termguicolors
   endif
 endif
"............................................................ 
"============================================================


"============================================================
"     --------   SYNTASTIC SETTINGS  ---------
"============================================================
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 " auto open location list when errors?
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_sass_checkers=['sass']
let g:syntastic_html_checkers=['eslint']
let g:syntastic_css_checkers=['']
let g:syntastic_loc_list_height = 5 " height of location list for errors 


"=============================================================
" ------------ CTRLP CUSTOMIZATIONS -------------
"=============================================================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"=============================================================
"       ---------  POWERLINE SETTINGS  ------------
"=============================================================
"set encoding=utf8
"set guifont=<FONT_NAME>:h<FONT_SIZE>
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

"============================================================
"           -------  CUSTOM TAB INDENTS  --------
"============================================================
" tabstop = max width of a tab char, shiftwidth = size of an indent in spaces
" softtabstop = when nonzero makes tab key insert a combo of spaces to
" simulate tab stops at this width
" expandtab = when enabled makes the tab key insert spaces instead of tabs
" smarttab = when enabled makes the tab key insert spaces or tabs to the next
" indent of the next tabstop
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
syntax on
set mouse=a

"=============================================================
"       --------  NERDCOMMENTOR OPTIONS  --------
"=============================================================
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"=============================================================
"        ----------  GOYO CUSTOMIZATIONS  ---------
"=============================================================
let g:goyo_linenr = 0
let g:goyo_width = 50+25
let g:goyo_height = 95

function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"==============================================================
"      -------  VIM AIRLINE CUSTOMIZATIONS  ---------
"==============================================================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#whitespace#checks = []
set laststatus=2
let g:airline_theme='murmur'
