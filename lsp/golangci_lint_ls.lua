return {
	cmd = { 'golangci-lint-langserver' },
	filetypes = { 'go', 'gomod' },
	root_markers = { 'go.mod', '.golangci.yml', '.golangci.yaml', '.golangci.toml', '.golangci.json' },
	init_options = {
		command = { 'golangci-lint', 'run', '--output.json.path=stdout', '--show-stats=false' },
	},
}
