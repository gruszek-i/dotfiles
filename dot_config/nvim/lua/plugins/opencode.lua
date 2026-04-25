return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = {
    {
      "folke/snacks.nvim",
      optional = true,
      opts = function(_, opts)
        opts.input = opts.input or {}
        opts.picker = opts.picker or {}
        opts.picker.actions = opts.picker.actions or {}
        opts.picker.actions.opencode_send = function(...)
          return require("opencode").snacks_picker_send(...)
        end
        opts.picker.win = vim.tbl_deep_extend("force", opts.picker.win or {}, {
          input = {
            keys = {
              ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
            },
          },
        })
      end,
    },
  },
  config = function()
    vim.g.opencode_opts = {}
    vim.o.autoread = true -- wymagane do reload eventów
    vim.keymap.set({ "n", "x" }, "<leader>oa", function()
      require("opencode").ask("@this: ", { submit = true })
    end, { desc = "Opencode Ask" })
    vim.keymap.set({ "n", "x" }, "<leader>os", function()
      require("opencode").select()
    end, { desc = "Opencode Select" })
    vim.keymap.set({ "n", "t" }, "<leader>ot", function()
      require("opencode").toggle()
    end, { desc = "Opencode Toggle" })
  end,
}
