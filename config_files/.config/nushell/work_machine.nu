# Specific configurations used in the work machine

# Check that we are connected to Stratesys VPN
def check_vpn [] {
    # `do {}` syntax to avoid printing stderr (curl uses stderr to show
    # http progress)
    let got_ip = (do {curl ifconfig.me} )
    $"($got_ip)" == "194.224.182.250" or $"($got_ip)" == "217.111.220.70"
}

# Open up my notes repo from everywhere
def notes [] {
    cd ~/GitRepos/Notes
    nvim .
}

# WSL specific config
$env.PATH = ($env.PATH | split row (char esep) | append "/home/sergio/.local/bin")
$env.GDK_DPI_SCALE = 1.3 # This is needed for WSL apps to render properly
