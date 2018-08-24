if has('python3')
  silent! python3 1
endif

set nocompatible              " be iMproved, required
filetype off                  " required

"===================Vundel.vim=================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Vim as a programmers' text editor
Plugin 'scrooloose/syntastic'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Raimondi/delimitMate'

" Making Vim look good
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
" Ctrlp magical vim plugin for finding files quickly
Plugin 'ctrlpvim/ctrlp.vim'
" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" ------python mode -------------
"Plugin 'klen/python-mode'
" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'universal-ctags/ctags'
" ----- fzf search in all files ------
set rtp+=~/.fzf
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
Plugin 'junegunn/fzf.vim' 
" ----- auto complete --------------
Plugin 'davidhalter/jedi-vim'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Shougo/deoplete.nvim'
"Plugin 'roxma/nvim-yarp'
"Plugin 'roxma/vim-hug-neovim-rpc'
"Plugin 'padawan-php/deoplete-padawan'
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

" ----- Plugin-Specific Settings --------------------------------------
" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark
" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256
" Set the colorscheme
"colorscheme molokai

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree
" Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0
"How can I open a NERDTree automatically when vim starts up if no files were specified?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <F6> :NERDTreeToggle<CR>

" We need this for plugins like Syntastic and vim-gitgutter which put symbols
" in the sign column.
hi clear SignColumn

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2
" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"  https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1
 " Show PASTE if in paste mode
let g:airline_detect_paste=1
 " Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

"---------- Neocomplete Settings-----------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
"--------Use deoplete---------------
"set pyxversion=3
"set encoding=utf-8
"let g:python3_host_prog = "/Users/wei/anaconda3/bin/python"
"let g:deoplete#enable_at_startup = 1
" ---YCM--------------
"
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" --- general setttings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
silent! py3 pass
syntax on 
set mouse=a
