-- ~/.config/nvim/after/ftdetect/helm.lua
vim.filetype.add({
	pattern = {
		-- Match any YAML file inside a templates folder → helm
		[".*/templates/.*%.ya?ml"] = "helm",
		-- Match values.yaml or values.yml → yaml.helm-values
		[".*/values%.ya?ml"] = "yaml.helm-values",
	},
})
