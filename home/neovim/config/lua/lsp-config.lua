-- Setup language servers.
local lspconfig = require('lspconfig')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

 vim.api.nvim_create_autocmd("BufWritePre", {
     buffer = buffer,
     callback = function()
         vim.lsp.buf.format { 
             async = false,
             filter = function(client) return client.name ~= "tsserver" end
         }
     end
 })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.bashls.setup {}
lspconfig.cssls.setup {}
lspconfig.html.setup {}
lspconfig.jsonls.setup {}
lspconfig.nil_ls.setup{}     

lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {},
  },
}

-- Elixir
lspconfig.elixirls.setup({
	cmd = { "/Users/Renan.Vaz/elixir-ls/release/language_server.sh" },
	-- Settings block is required, as there is no default set for elixir
	settings = {
		elixirLs = {
			dialyzerEnabled = true,
			dialyzerFormat = "dialyxir_long",
		},
	},
	capabilities = capabilities,
})

lspconfig.tsserver.setup({
	init_options = require("nvim-lsp-ts-utils").init_options,
	on_attach = function(client, bufnr)
		on_attach(client, bufnr)

		-- Let eslint format
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		local ts_utils = require("nvim-lsp-ts-utils")
		ts_utils.setup({
			enable_import_on_completion = true,
		})
		ts_utils.setup_client(client)
	end,
	capabilities = capabilities,
})

-- Web
-- ESLint
-- lspconfig.eslint.setup({ on_attach = function(client, bufnr) on_attach(client, bufnr) end, capabilities = capabilities, })
