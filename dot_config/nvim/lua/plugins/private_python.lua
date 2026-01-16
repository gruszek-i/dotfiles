return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = false,
        -- ty as type checker
        ty = {},
        -- ruff as linter/formatter
        ruff = {
          init_options = {
            settings = {
              organizeImports = true,
            },
          },
          -- disable ruff hovers
          on_attach = function(client, _)
            client.server_capabilities.hoverProvider = false
          end,
        },
      },
    },
  },
}
