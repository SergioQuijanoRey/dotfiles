# Do an ls sorted by real size
# We substitute `ls` `size` for a real size computed using `du`
def sizels [path: string = "."] {
    ls $path
    | insert realsize {|el|
        try {du $el.name | get physical | get 0} catch {$el.size}
    }
    | sort-by -r realsize
    | reject size
    | rename -c [realsize size]
}

# Search for a given process
def findps [ps_name: string] {
    ps | where name =~ $ps_name
}

# URL shortener from the command line
# We are using tinyurl as the base provider
def short_url [url: string] {
    curl -s $"http://tinyurl.com/api-create.php?url=($url)"
}

# Tries to run a `command`. If it goes right, notifies `exitmsg`, otherwise
# it notifies `failuremsg`
def try-notify [command: string, exitmsg: string, failuremsg: string] {
    try {
        ^$command
        notify-send $exitmsg
    } catch {
        notify-send -u critical $failuremsg
    }
}

# Kills all processes that match with `ps_name`
def killall [ps_name: string] {
    findps $ps_name | get pid | each -k {|id| kill -9 $id}

}

# Open up my notes repo from everywhere
def notes [] {
    cd ~/GitRepos/Notes
    nvim .
}

def fastman [command: string] {
    curl $"cheat.sh/($command)"
}

# Check that we are connected to Stratesys VPN
def check_vpn [] {
    # `do {}` syntax to avoid printing stderr (curl uses stderr to show
    # http progress)
    let got_ip = (do {curl ifconfig.me} )
    $"($got_ip)" == "194.224.182.250" or $"($got_ip)" == "217.111.220.70"
}
