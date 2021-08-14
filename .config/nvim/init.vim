" Giorgio Grigolo's nvim cfg.
"         
" A customized init.vim for neovim (https://neovim.io/)     

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set path+=**					" Searches current directory recursively.
set wildmenu					" Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set t_Co=256                    " Set if term supports 256 colors.
set number relativenumber       " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1
set encoding=UTF-8
let mapleader = ";"
setlocal spell spelllang=en_gb
set spell!                      "Disable spellchecker on start.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VimTex Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'


let g:colorizer_auto_color = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
"{{ File management }}
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
    Plug 'psliwka/vim-smoothie'
"{{Language support }}
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
    Plug 'artur-shaik/vim-javacomplete2'
"{{ Code shortcuts }}
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    "Plug 'SirVer/ultisnips'
"{{ Linters }}
    Plug 'vim-syntastic/syntastic'
"{{ LaTex }}
    Plug 'lervag/vimtex'
"{{ Aesthetics }}
	Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Rigellute/shades-of-purple.vim'
    Plug 'vim-python/python-syntax'                    " Python highlighting
    Plug 'ap/vim-css-color'                            " Color previews for CSS
call plug#end()

""{{ Deoplete }}
 
    call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Toggle Deoplete
 function! ToggleDeoplete()
     if deoplete#is_enabled()
         call deoplete#disable()
         echo 'Deoplete OFF'
     else
         call deoplete#enable()
         echo 'Deoplete ON'
     endif
 endfunction
 nnoremap <silent> <Leader>d :call ToggleDeoplete() <CR>

" Toggle Spellcheck
function! ToggleSpellCheck()
    set spell!
    if &spell
        echo 'Spellcheck ON'
    else
        echo 'Spellcheck OFF'
    endif
endfunction 
nnoremap <silent> <Leader>s :call ToggleSpellCheck() <CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General tweaks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Disable Autocommenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
 
" Remap ESC to ii
:imap ii <Esc>

" Chezmoi auto apply
autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %

" Mouse scrolling
set mouse=nicr
set mouse=a

if (has("termguicolors"))
 set termguicolors
endif
colorscheme shades_of_purple


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.
set softtabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=0
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-Instant-Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Open terminal inside Vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>tt :vnew term://zsh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mouse Scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Other Stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org 
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Hack_Bold:h15
