return {
    "mfussenegger/nvim-dap",
    opts = {
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
            max_height = nil,  -- These can be integers or a float between 0 and 1.
            max_width = nil,   -- Floats will be treated as percentage of your screen.
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
    },
    config = function(_, opts)
        -- Configuration for debugging UI
        require("dapui").setup(opts)

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
        local dap = require("dap")

        setmap_group_name("<leader>d", "Debugging")
        setmap("n", "<leader>dc", dap.continue, {}, "Continue")
        setmap("n", "<leader>do", dap.step_over, {}, "Step over")
        setmap("n", "<leader>di", dap.step_into, {}, "Step into")
        setmap("n", "<leader>dx", dap.step_out, {}, "Step out")
        setmap("n", "<leader>db", dap.toggle_breakpoint, {}, "Toggle Breakpoint")
        setmap("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, {},
            "Set breakpoint with condition")
        setmap("n", "<leader>dl",
            function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
            {},
            "Set breakpoint with log message")
        setmap("n", "<leader>dr", dap.repl.open, {}, "Open the REPL")

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
    end,
    dependencies = {
        -- UI for debugging
        { "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },

        -- Virtual text for debugging sessions
        "theHamsta/nvim-dap-virtual-text",

        -- Having telescope utils
        "nvim-telescope/telescope-dap.nvim",

        -- Easily configure python debugging
        {
            "mfussenegger/nvim-dap-python",
            ft = { "python" },
            config = function()
                local runcommand = require("myconf.aux").runcommand
                local setmap = require("myconf.aux").setmap
                local strsplit = require("myconf.aux").strsplit

                -- We are using nixos so the path changes over time
                local python_path = runcommand("whereis python", false)

                -- If we're running inside a nix shell, more of one results will pop up
                -- Consider only the first result
                -- Also, we get the string python: <path1> <path2>
                -- So always, get the second element in the table
                local python_path_splitted = strsplit(python_path, " ")
                local python_path = python_path_splitted[2]

                -- Using global python and not venv python
                -- Getting that glob path dynamically
                require('dap-python').setup(python_path)

                -- Set a special keybinding for python
                setmap("n", "<leader>dt", require('dap-python').test_method, {}, "Test method for python")
            end
        },
    },
}
