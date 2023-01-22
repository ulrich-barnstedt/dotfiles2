local version = vim.version()
local vim_text = "Neovim " .. version.major .. "." .. version.minor .. "." .. version.patch

require("presence"):setup({
    auto_update         = true,                       
    neovim_image_text   = vim_text,
    main_image          = "file",
    buttons             = true,                   
})
