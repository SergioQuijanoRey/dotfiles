# In this file we are going to setup some other programs integrations with nushell

# Setup atuin
# In `atuin init` disable the up-arrow config, it is very annoying
mkdir ~/.local/share/atuin
atuin init nu --disable-up-arrow | save -f ~/.local/share/atuin/init.nu
source ~/.local/share/atuin/init.nu

# Setup zoxide
zoxide init nushell | str replace --all "-- $rest" "-- ...$rest" | str replace --all "def-env" "def --env" | save -f ~/.zoxide.nu
source ~/.zoxide.nu

# Setup starship
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
use ~/.cache/starship/init.nu
