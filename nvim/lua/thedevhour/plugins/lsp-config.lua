return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local lspconfig = require("lspconfig")

		vim.filetype.add({
			pattern = {
				["*/templates/*.yaml"] = "helm",
				["*/templates/*.yml"] = "helm",
				["*values.yaml"] = "yaml.helm-values",
				["*values.yml"] = "yaml.helm-values",
			},
		})

		lspconfig.yamlls.setup({
			settings = {
				redhat = { telemetry = { enabled = false } },
				yaml = {
					validate = true,
					hover = true,
					completion = true,
					schemas = {
						kubernetes = "k8s-*.yaml",
						["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
						["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
					},
				},
			},
		})

		lspconfig.helm_ls.setup({
			cmd = { "helm_ls", "serve" },
			filetypes = { "helm", "yaml.helm-values" },
			root_dir = lspconfig.util.root_pattern("Chart.yaml"),
		})
	end,
}
