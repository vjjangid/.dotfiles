return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup() --To initiate dap ui

		--Set listeners so that it opens dap ui when press F5
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		local home = vim.loop.os_homedir()
		local netcoredb_path

		if vim.fn.has("win32") == 1 then
			netcoredb_path = home .. "\\scoop\\apps\\netcoredbg\\current\\netcoredbg.exe"
		else
			--set up the path mac
			print("Set debugger path")
		end

		--Setting configuration for c# adapter
		dap.adapters.coreclr = {
			type = "executable",
			command = netcoredb_path,
			args = { "--interpreter=vscode" },
		}

		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "launch - netcoredbg",
				request = "launch",
				-- program = "F:\\LogsAnalyzer\\LogsAnalyzer\\LogsAnalyzer\\bin\\Debug\\net8.0\\LogsAnalyzer.dll",
				-- 	function()
				-- 	return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
				-- end,
				program = function()
					-- Dynamically detect default build output
					local cwd = vim.fn.getcwd()
					local dlls = vim.fn.glob(cwd .. "/bin/Debug/net*/**/*.dll", true, true)

					if #dlls == 1 then
						return dlls[1]
					elseif #dlls > 1 then
						return vim.fn.input("Select DLL: ", dlls[1], "file")
					else
						return vim.fn.input("Path to dll: ", cwd .. "/bin/Debug/", "file")
					end
				end,
			},
		}

		vim.keymap.set("n", "<F5>", function()
			require("dap").continue()
		end, { desc = "Continue" })
		vim.keymap.set("n", "<F10>", function()
			require("dap").step_over()
		end, { desc = "Step over" })
		vim.keymap.set("n", "<F11>", function()
			require("dap").step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			require("dap").step_out()
		end)
		vim.keymap.set("n", "<Leader>b", function()
			require("dap").toggle_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>B", function()
			require("dap").set_breakpoint()
		end)
		vim.keymap.set("n", "<Leader>lp", function()
			require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end)
		vim.keymap.set("n", "<Leader>dr", function()
			require("dap").repl.open()
		end)
		vim.keymap.set("n", "<Leader>dl", function()
			require("dap").run_last()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
			require("dap.ui.widgets").hover()
		end)
		vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
			require("dap.ui.widgets").preview()
		end)
		vim.keymap.set("n", "<Leader>df", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.frames)
		end)
		vim.keymap.set("n", "<Leader>ds", function()
			local widgets = require("dap.ui.widgets")
			widgets.centered_float(widgets.scopes)
		end)
	end,
}
