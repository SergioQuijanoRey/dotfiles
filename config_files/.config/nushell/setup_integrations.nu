# In this file we are going to setup some other programs integrations with nushell

# Setup atuin
mkdir ~/.local/share/atuin
atuin init nu --disable-up-arrow | save -f ~/.local/share/atuin/init.nu #make sure you created the directory beforehand with `mkdir ~/.local/share/atuin/init.nu`
source ~/.local/share/atuin/init.nu

# Setup zoxide
zoxide init nushell | save -f ~/.zoxide.nu
source ~/.zoxide.nu

