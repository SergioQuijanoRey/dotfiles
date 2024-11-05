mkdir ~/.local/share/atuin
atuin init nu --disable-up-arrow | save -f ~/.local/share/atuin/init.nu

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

zoxide init nushell | save -f ~/.zoxide.nu
