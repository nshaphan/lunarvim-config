-- Configure Github Copilot
local ok, copilot = pcall(require, "copilot")
if not ok then
  return
end

copilot.setup {
  suggestion = {
    keymap = {
      accept = "<c-l>",
      next = "<c-j>",
      prev = "<c-k>",
      dismiss = "<c-h>",
    },
  },
  filetypes = {
    ["*"] = true,
  },
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<c-s>", "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>", opts)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })
