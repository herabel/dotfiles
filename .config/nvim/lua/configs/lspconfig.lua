local nvlsp = require "nvchad.configs.lspconfig"

-- load defaults i.e. diagnostic config, LspAttach mappings, lua_ls
nvlsp.defaults()

local servers = { "html", "cssls", "gopls" }

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
        loadOutDirsFromCheck = true,
        runBuildScripts = true,
      },
      check = {
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
    },
  },
})
vim.lsp.enable("rust_analyzer")
