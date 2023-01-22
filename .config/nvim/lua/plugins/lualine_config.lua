local function get_heart()
    return ""
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'onedark',
        -- component_separators = { left = '', right = ''},
        -- component_separators = { left = '│', right = '│'},
        component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            "NvimTree",
        },
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {
            'branch', 
            {
                'diff',
                colored = true,
            }, 
            'diagnostics'},
            lualine_c = {"filename"},
            lualine_x = {
                {
                    get_heart,
                    color = { fg = 204 }
                },
                'fileformat',
                'encoding'
            },
            lualine_y = {
                {
                    'filetype',
                    icons_enabled = true,
                    colored = true
                    -- icon_only = true
                }
            },
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
    }
