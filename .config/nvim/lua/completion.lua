require "lspconfig".clangd.setup{}
require "lspconfig".gdscript.setup{}
require "lspconfig".gopls.setup{}
require "lspconfig".pylsp.setup{}
require "lspconfig".rust_analyzer.setup{}

require "lspconfig".diagnosticls.setup{
	filetypes = { "sh" },
	init_options = {
		filetypes = { sh = "shellcheck" },
		linters = {
			shellcheck = {
				sourceName = "shellcheck",
				command = "shellcheck",
				debounce = 100,
				args = { "--format=gcc", "-" },
				formatPattern = {
					"^[^:]+:(\\d+):(\\d+):\\s+([^:]+):\\s+(.*)$",
					{
						line = 1,
						column = 2,
						security = 3,
						message = 4
					};
				},
				securities = {
					error = "error",
					warning = "warning",
					note = "info"
				};
			}
		}
	}
}


vim.diagnostic.config {
	update_in_insert = true,
	virtual_text = false,
	underline = true,
	signs = true
}



--
-- nvim-cmp
--

local cmp = require "cmp"

cmp.setup({
	preselect = cmp.PreselectMode.None,
	mapping = {
		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item()),
		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item()),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<C-u>'] = cmp.mapping.scroll_docs(-6),
		['<C-d>'] = cmp.mapping.scroll_docs(6),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
	}
})

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	}
})

cmp.setup.cmdline(":", {
	sources = {
		{ name = "path" },
		{ name = "cmdline" },
	}
})
