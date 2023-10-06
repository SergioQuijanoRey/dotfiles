local aux = require("myconf/aux")

-- Configuration for debugging UI
require("dapui").setup({
    icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    -- Expand lines larger than the window
    -- Requires >= 0.7
    expand_lines = vim.fn.has("nvim-0.7") == 1,
    -- Layouts define sections of the screen to place windows.
    -- The position can be "left", "right", "top" or "bottom".
    -- The size specifies the height/width depending on position. It can be an Int
    -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
    -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
    -- Elements are the elements shown in the layout (in order).
    -- Layouts are opened in order so that earlier layouts take priority in window sizing.
    layouts = {
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                { id = "scopes", size = 0.25 },
                "breakpoints",
                "stacks",
                "watches",
            },
            size = 40, -- 40 columns
            position = "left",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.25, -- 25% of total lines
            position = "bottom",
        },
    },
    controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = true,
        -- Display controls in this element
        element = "repl",
        icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "↻",
            terminate = "□",
        },
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
    render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
    }
})

-- Open the UI elements automatically when a debugging session starts
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Allow virtual text on debugging sessions
require("nvim-dap-virtual-text").setup()

-- Keymaps
local setmap = require("myconf/aux").setmap
local setmap_group_name = require("myconf/aux").setmap_group_name
setmap_group_name("<leader>d", "Debugging")
setmap("n", "<leader>dc", ":lua require'dap'.continue()<CR>", {}, "Continue")
setmap("n", "<leader>do", ":lua require'dap'.step_over()<CR>", {}, "Step over")
setmap("n", "<leader>di", ":lua require'dap'.step_into()<CR>", {}, "Step into")
setmap("n", "<leader>dx", ":lua require'dap'.step_out()<CR>", {}, "Step out")
setmap("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", {}, "Toggle Breakpoint")
setmap("n", "<leader>dB", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {}, "Set breakpoint with condition")
setmap("n", "<leader>dl", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", {}, "Set breakpoint with log message")
setmap("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", {}, "Open the REPL")
setmap("n", "<leader>dt", ":lua require'dap-python'.test_method()<CR>", {}, "Test method for python")

-- == Configuration for Python ==

-- We are using nixos so the path changes over time
python_path = aux.runcommand("whereis python", false)

-- If we're running inside a nix shell, more of one results will pop up
-- Consider only the first result
-- Also, we get the string python: <path1> <path2>
-- So always, get the second element in the table
python_path_splitted = aux.strsplit(python_path, " ")
python_path = python_path_splitted[2]

-- Using global python and not venv python
-- Getting that glob path dynamically
require('dap-python').setup(python_path)


-- == Configuration for C++ and Rust ==
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
  name = 'lldb'
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},

        -- To allow debugger to inherit env vars
        env = function()
            local variables = {}
            for k, v in pairs(vim.fn.environ()) do
                table.insert(variables, string.format("%s=%s", k, v))
            end
            return variables
        end,
    }
}

-- Same configuration for C++ and Rust
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
