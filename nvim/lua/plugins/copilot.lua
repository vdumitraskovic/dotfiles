return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_lsp_settings = {
			telemetry = {
				telemetryLevel = "off",
			},
		}
	end,
}
