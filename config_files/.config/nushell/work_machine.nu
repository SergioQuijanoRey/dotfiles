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

# Run jupyter lab with an IP that can be accessed through windows web browser
def wsllab [] {
    let dinip = (python3 -c "import subprocess; subprocess.run(['hostname', '-I'], text=True).stdout") | str trim
    echo $"Running jupyter lab on IP: ($dinip)"
    jupyter lab --ip $"($dinip)" .
}

# WSL specific config
$env.PATH = ($env.PATH | split row (char esep) | append "/home/sergio/.local/bin")
$env.GDK_DPI_SCALE = 1.0 # This is needed for WSL apps to render properly

# Home of the windows user
$env.WINHOME = "/mnt/d/Users/sergio.quijano"
