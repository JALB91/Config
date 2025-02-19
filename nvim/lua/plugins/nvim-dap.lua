-- DAP for local debugging
return {
	"mfussenegger/nvim-dap",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-nvim-dap").default_setup({
			ensure_installed = { "codelldb" },
		})
		local dap = require("dap")
		dap.adapters.python = {
			name = "python",
			type = "executable",
		}
		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch python",
				program = "${file}",
			},
		}

		dap.adapters.lldb = {
			name = "lldb",
			type = "executable",
			command = "/usr/bin/lldb",
		}
		dap.configurations.cpp = {
			{
				type = "lldb",
				request = "launch",
				name = "Launch cpp",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = true,
				args = {},
			},
		}
	end,
}
