return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.diagnostic.config({
			--virtual_lines = true,
			underline = true,
			virtual_text = true,
			float = {
				border = "rounded",
				source = true,
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
				numhl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					[vim.diagnostic.severity.WARN] = "WarningMsg",
				},
			},
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		-- require("lspconfig").yamlls.setup({
		-- 	settings = {
		-- 		yaml = {
		-- 			schemas = {
		-- 				kubernetes = "k8s-*.yaml",
		-- 				["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
		-- 				["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
		-- 				["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/**/*.{yml,yaml}",
		-- 				["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
		-- 				["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
		-- 				["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
		-- 				["http://json.schemastore.org/circleciconfig"] = ".circleci/**/*.{yml,yaml}",
		-- 			},
		-- 		},
		-- 	},
		-- })
	end,
}
