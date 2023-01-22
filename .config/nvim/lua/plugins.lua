return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'navarasu/onedark.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua'
    use 'andweeb/presence.nvim'
    use 'windwp/nvim-autopairs'
    use 'mg979/vim-visual-multi'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'numToStr/Comment.nvim'
    use 'moll/vim-bbye'
    use 'lewis6991/impatient.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }   
    use {
        'akinsho/bufferline.nvim', 
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }   
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
end)


-- Removed:
-- goolord/alpha-nvim
-- use "lukas-reineke/indent-blankline.nvim"

