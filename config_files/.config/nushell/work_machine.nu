# Specific configurations used in the work machine

# WSL specific config
$env.PATH = $env.PATH | append "/home/sergio/.nix-profile/bin"
$env.PATH = ($env.PATH | split row (char esep) | append "/home/sergio/.local/bin")
$env.GDK_DPI_SCALE = 1.0 # This is needed for WSL apps to render properly

# This is useful to apply custom behaviour in other parts of the configuration when in working machine
# For example, in the `functions.nu` file
$env.WORKING_MACHINE = true
