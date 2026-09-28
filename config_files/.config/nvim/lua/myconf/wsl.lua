-- clip.exe spawned as a subprocess by Neovim fails silently inside Zellij because
-- Zellij's PTY layer interferes with stdin piping for WSL interop processes.
-- OSC52 sidesteps this: Neovim emits a terminal escape sequence that Zellij
-- forwards to Windows Terminal, which writes it directly to the Windows clipboard.
local IS_WSL = true
if IS_WSL then
	local osc52 = require("vim.ui.clipboard.osc52")
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = osc52.copy("+"),
			["*"] = osc52.copy("*"),
		},
		-- PowerShell reads from Windows clipboard; OSC52 paste is not used because
		-- it requires dangerously_enable_paste_buffer_read in Zellij.
		paste = {
			["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end
