return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- Plugin explicitly says it does NOT support lazy loading
        lazy = false,
        -- Update parsers on version change
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
        config = function()
            -- Minimal setup (only accepts install_dir now)
            require("nvim-treesitter").setup({})

            -- Neovim 0.12+ has treesitter highlighting built-in.
            -- Enable it for all filetypes.
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })

            -- Treesitter-based indentation (experimental, provided by plugin)
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            -- Install parsers (no-op if already installed)
            local ensure_installed = {
                "json",
                "python",
                "javascript",
                "query",
                "typescript",
                "tsx",
                "php",
                "yaml",
                "html",
                "css",
                "markdown",
                "markdown_inline",
                "bash",
                "lua",
                "vim",
                "vimdoc",
                "c",
                "dockerfile",
                "gitignore",
                "astro",
            }
            local installed = require("nvim-treesitter.config").get_installed()
            local to_install = vim.tbl_filter(function(lang)
                return not vim.list_contains(installed, lang)
            end, ensure_installed)
            if #to_install > 0 then
                require("nvim-treesitter").install(to_install):wait(60000)
            end

            -- Textobjects via nvim-treesitter-textobjects
            require("nvim-treesitter-textobjects").setup({
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                    },
                },
            })
        end,
    },
}
