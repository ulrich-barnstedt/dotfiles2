require("bufferline").setup {
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                -- text = "Files",
                text_align = "left",
                separator = true
            }
        },
        show_close_icon = false,
        always_show_bufferline = false,
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        separator_style = {"█", "█"}
    }
}
