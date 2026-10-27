-- clip.exe spawned as a subprocess by Neovim fails silently inside Zellij because
-- Zellij's PTY layer interferes with stdin piping for WSL interop processes.
-- OSC52 sidesteps this: Neovim emits a terminal escape sequence that Zellij
-- forwards to Windows Terminal, which writes it directly to the Windows clipboard.
local IS_WSL = true
if IS_WSL then
	local osc52 = require("vim.ui.clipboard.osc52")

	-- PowerShell reads from the Windows clipboard; OSC52 paste is not used because
	-- it requires dangerously_enable_paste_buffer_read in Zellij.
	--
	-- Windows PowerShell 5.1 writes stdout in the legacy console OEM codepage (CP437
	-- here), so "á" arrives as the single byte 0xA0 instead of UTF-8 0xC3 0xA1.
	-- Neovim renders such invalid bytes as "<a0>", which is why accents used to paste
	-- back as angle-bracket garbage. Forcing a BOM-less UTF-8 Console.OutputEncoding
	-- makes the byte stream match 'encoding'.
	--
	-- The argument must stay pure ASCII (the command line is itself transmitted in the
	-- OEM codepage) and quote-free (double quotes would have to survive the WSL interop
	-- argv -> Windows command line round trip), hence [char]13 and [string]::Empty.
	local paste_command = {
		"powershell.exe",
		"-NoLogo",
		"-NoProfile",
		"-NonInteractive",
		"-Command",
		-- The $null guard matters because Get-Clipboard returns $null for an empty or
		-- non-text clipboard, and calling .Replace() on it aborts the paste with an error.
		"[Console]::OutputEncoding = New-Object System.Text.UTF8Encoding $false; "
			.. "$clip = Get-Clipboard -Raw; "
			.. "if ($null -ne $clip) { [Console]::Out.Write($clip.Replace([string][char]13, [string]::Empty)) }",
	}

	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = osc52.copy("+"),
			["*"] = osc52.copy("*"),
		},
		-- A list (argv) rather than a string: provider/clipboard.vim splits a string
		-- command on spaces, which would shred the PowerShell expression above.
		paste = {
			["+"] = paste_command,
			["*"] = paste_command,
		},
		cache_enabled = 0,
	}
end
