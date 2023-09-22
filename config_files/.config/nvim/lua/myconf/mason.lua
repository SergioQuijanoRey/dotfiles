-- Mason general config

-- TODO -- move to proper location
local function osExecute(cmd)
    local fileHandle     = assert(io.popen(cmd, 'r'))
    local commandOutput  = assert(fileHandle:read('*a'))
    local returnTable    = {fileHandle:close()}
    return commandOutput,returnTable[3]            -- rc[3] contains returnCode
end

-- Make mason packages work with nixos
-- We're using patchelf to mathe that work
-- Thanks to: https://github.com/williamboman/mason.nvim/issues/428#issuecomment-1357192515
local mason_registry = require("mason-registry")
mason_registry:on("package:install:success", function(pkg)
    pkg:get_receipt():if_present(function(receipt)

        -- Figure out the interpreter inspecting nvim itself
        -- This is the same for all packages, so compute only once
        local interpreter = osExecute(
            "patchelf --print-interpreter $(grep -oE '\\/nix\\/store\\/[a-z0-9]+-neovim-unwrapped-[0-9]+\\.[0-9]+\\.[0-9]+\\/bin\\/nvim' $(which nvim))"
        )


        for _, rel_path in pairs(receipt.links.bin) do
            local bin_abs_path = pkg:get_install_path() .. "/" .. rel_path

            -- Set the interpreter on the binary
            local result = os.execute(
                'patchelf --set-interpreter ' .. interpreter .. " " .. bin_abs_path
            )

            print("TODO -- result is " .. result)

            if result == 0 then
                print("[Patchelf] Succesful patch for " .. rel_path)
            else
                print("[Patchelf] Error " .. result .. " for " .. rel_path)
            end
        end
    end)
end)

-- List with all options can be found in their github
require("mason").setup({
    keymaps = {
        -- Keymap to expand a package
        toggle_package_expand = "<CR>",
        -- Keymap to install the package under the current cursor position
        install_package = "i",
        -- Keymap to reinstall/update the package under the current cursor position
        update_package = "u",
        -- Keymap to check for new version for the package under the current cursor position
        check_package_version = "c",
        -- Keymap to update all installed packages
        update_all_packages = "U",
        -- Keymap to check which installed packages are outdated
        check_outdated_packages = "C",
        -- Keymap to uninstall a package
        uninstall_package = "X",
        -- Keymap to cancel a package installation
        cancel_installation = "<C-c>",
        -- Keymap to apply language filter
        apply_language_filter = "<C-f>",
    },
})

-- Adapter to use mason with lspconfig
-- This has to be runned before setting up lspconfig
require("mason-lspconfig").setup({

    -- This was done before with lspinstall plugin that now mason replaces
    -- TODO -- set to true
    automatic_installation = false,
})
