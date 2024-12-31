
<br>
<br>

# Konfigurasi Neovim
---

Selanjutnya kita akan melakukan konfigurasi dart language server pada Neovim (dengan lazy sebagai configuration framework) agar bisa menggunakan fitur seperti auto-completion, linting, navigasi kode, dan dokumentasi.
Selain itu kita akan sekaligus menambahkan plugin flutter-tools untuk menambah fitur-fitur untuk memudahkan menulis kode flutter.
Saat kita menginstal flutter, kita otomatis akan menginstall bahasa dart beserta dart language server (dartls). Karena itu kita hanya perlu menambahkan setup dartls dengan cara menambahkan kode berikut pada konfigurasi plugin language server protocol (LSP).

```lua

return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    vim.keymap.set("n", "<leader>FS", ":FlutterRun <CR>", {})
    vim.keymap.set("n", "<leader>FQ", ":FlutterQuit <CR>", {})
    vim.keymap.set("n", "<leader>FR", ":FlutterRestart <CR>", {})
    vim.keymap.set("n", "<leader>LR", ":FlutterLspRestart <CR>", {})
    vim.keymap.set("n", "<leader>FD", ":FlutterDevTools <CR>", {})
    require("flutter-tools").setup({
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      dev_tools = {
        autostart = true, -- autostart devtools server if not detected
        auto_open_browser = true, -- Automatically opens devtools in the browser
      },
      lsp = {
        color = { -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        },
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "ErrorMsg", -- highlight for the closing tag
        prefix = ">", -- character to use for close tag e.g. > Widget
        priority = 10, -- priority of virtual text in current line
        -- consider to configure this when there is a possibility of multiple virtual text items in one line
        -- see `priority` option in |:help nvim_buf_set_extmark| for more info
        enabled = false, -- set to false to disable
      },
    })
  end,
}
```

