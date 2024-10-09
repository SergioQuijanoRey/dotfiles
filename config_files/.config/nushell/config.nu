# Integrations with other programs
# Do this first as other places rely on this setup
source ~/.config/nushell/setup_integrations.nu

# Source the enviroment variable
# There we config the nushell configs and the prompt look
source ~/.config/nushell/env.nu

# My aliases
source ~/.config/nushell/aliases.nu

# My functions
source ~/.config/nushell/functions.nu

# Work-specific configuration
# source ~/.config/nushell/work_machine.nu
# Hooks
source ~/.config/nushell/hooks.nu
