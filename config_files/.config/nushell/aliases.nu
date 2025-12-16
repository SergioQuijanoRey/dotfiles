alias v = nvim .
alias ng = nvim -c 'Neogit kind=replace'
alias uvim = uv run nvim

alias rebuild = sudo nixos-rebuild switch --flake /home/sergio/.config/nixos/.#workstation

alias filesize = du

alias ll = exa -l
alias lla = exa -la

alias uncommit = git reset --soft HEAD~1

alias py = python3

alias myip = curl ifconfig.me

alias wo = wsl-open
alias wcode = /home/sergio/.nix-profile/bin/code

#alias gl = git log --oneline --graph --parents --decorate --all
alias gl = git-graph --model simple --no-pager --format "%h %d %s ==> %an %as"
alias lg = lazygit
