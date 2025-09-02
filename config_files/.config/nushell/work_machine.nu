# Specific configurations used in the work machine

# WSL specific config
$env.PATH = ($env.PATH | split row (char esep) | append "/home/sergio/.local/bin")
$env.PATH = $env.PATH | append "/home/sergio/.nix-profile/bin"
$env.GDK_DPI_SCALE = 1.0 # This is needed for WSL apps to render properly

# Home of the windows user
$env.WINHOME = "/mnt/c/Users/squijanr/"
$env.ONEDRIVE = ($env.WINHOME | path join "OneDrive - NTT DATA EMEAL")
$env.WINDESK = ($env.ONEDRIVE | path join "Desktop")

# Some paths to projects
$env.ORANGE_PRIVADO = ($env.ONEDRIVE | path join "Projects/03 - EDV Sharepoint Privado" )

# Add ZScaler CA perms to python requests library
$env.REQUESTS_CA_BUNDLE = "/home/sergio/CA_CERTIFICATES/Zscaler_Root_CA.pem"

# This is useful to apply custom behaviour in other parts of the configuration when in working machine
# For example, in the `functions.nu` file
$env.WORKING_MACHINE = true
