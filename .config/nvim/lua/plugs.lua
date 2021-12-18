-- plugins --

return require("packer").startup(function()
	-- packer.nvim manages itself
	use("wbthomason/packer.nvim")

	---------------------------------------

	-- better commenting
	use("tpope/vim-commentary")

	-- better brackets
	use("tpope/vim-surround")

	---------------------------------------
	
	use("dstein64/vim-startuptime")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- tree-sitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- tree-sitter dependency
	use("BurntSushi/ripgrep")
	-- colorscheme
	use 'Mofiqul/dracula.nvim'

	-- start screen
	use("mhinz/vim-startify")

	-- distraction free writing
	use("junegunn/goyo.vim")

	---------------------------------------

	-- git integration
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- tex/latex integration
	use({
		"lervag/vimtex",
		ft = { "tex" },
	})

	---------------------------------------

	-- lsp config
	use("neovim/nvim-lspconfig")

	-- autocomplete
	use("hrsh7th/nvim-cmp")

	-- lsp source for nvim-cmp
	use("hrsh7th/cmp-nvim-lsp")

	-- snipptes plugin
	use("hrsh7th/vim-vsnip")

	-- lsp plugin integration
	use("hrsh7th/vim-vsnip-integ")

	---------------------------------------

	-- fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use("SirVer/ultisnips")

	-- navigation tree
	use("kyazdani42/nvim-tree.lua")
	
	-- formatter
	use("prettier/vim-prettier")
end)
