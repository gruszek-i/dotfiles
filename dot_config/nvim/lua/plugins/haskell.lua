return {
  -- nvim crashes instantly because of a treesitter bug that is yet to be fixed
  -- https://github.com/tree-sitter/tree-sitter-haskell/pull/157
  {
    "nvim-treesitter/nvim-treesitter",
    init = function()
      local group = vim.api.nvim_create_augroup("PatchedHaskellTreesitterParser", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "TSUpdate",
        callback = function()
          local parsers = require("nvim-treesitter.parsers")
          parsers.haskell = parsers.haskell or {}
          parsers.haskell.install_info = {
            url = "https://github.com/rynewang/tree-sitter-haskell",
            revision = "6247f81e55392377ef96c58ae7eff037c995dfb9",
          }
        end,
      })
    end,
  },
  -- haskell tools start 2 LSPs, this makes it only start one
  -- https://github.com/LazyVim/LazyVim/issues/7146
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.hls = opts.servers.hls or {}
      opts.servers.hls.mason = false
      opts.setup = opts.setup or {}
      opts.setup.hls = function()
        return true
      end
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    init = function()
      vim.g.haskell_tools = {
        tools = {
          repl = {
            auto_focus = true,
          },
        },
      }
    end,
    keys = {
      {
        "<localleader>r",
        function()
          require("haskell-tools").repl.toggle()
        end,
        ft = "haskell",
        desc = "GHCi repl package",
      },
      {
        "<localleader>R",
        function()
          require("haskell-tools").repl.toggle(vim.api.nvim_buf_get_name(0))
        end,
        ft = "haskell",
        desc = "GHCi repl buffer",
      },
    },
  },
}
