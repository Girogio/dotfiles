set relativenumber
set nocompatible
set wildmode=longest,list,full
set wildmenu
set tabstop=2
set shiftwidth=2
set tw=85
set softtabstop=2
set expandtab
set noshiftround
set clipboard=unnamedplus
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:>
runtime! macros/matchit.vim
set noswapfile



set hidden
set ttyfast

set showmode
set showcmd

nnoremap / /\v
vnoremap / /\v

let g:tex_flavor = "latex"

if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

let g:vimtex_view_method = 'zathura'
" One of the neosnippet plugins will conceal symbols in LaTeX which is
" confusing
let g:tex_conceal = ""

let g:Tex_IgnoredWarnings = 
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'specifier changed to'."\n".
    \'You have requested'."\n".
    \'Missing number, treated as zero.'."\n".
    \'There were undefined references'."\n".
    \'Citation %.%# undefined'."\n".
    \'Double space found.'."\n"
let g:Tex_IgnoreLevel = 8
let g:vimtex_quickfix_open_on_warning = 0

let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'


map <F8> :w <CR> :!gcc % && ./a.out <CR>

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

call plug#begin()
  Plug 'dracula/vim', {'as': 'dracula'}
	Plug 'KeitaNakamura/tex-conceal.vim'
  Plug 'itchyny/lightline.vim'
	Plug 'lervag/vimtex'
	Plug 'dense-analysis/ale'
	Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'preservim/nerdtree'
  Plug 'sirver/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  Plug 'cdelledonne/vim-cmake'
call plug#end()

let g:lightline = { 'colorscheme': 'dracula' }
au BufReadPost,BufNewFile *.tex VimtexView

set guifont=SauceCodePro\ Nerd\ Font\ Mono:h16
syntax on
colorscheme dracula
hi Normal ctermbg=none
