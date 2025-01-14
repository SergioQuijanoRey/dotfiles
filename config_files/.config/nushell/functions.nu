# Do an ls sorted by real size
# We substitute `ls` `size` for a real size computed using `du`
def sizels [path: string = "."] {
    ls $path
    | insert realsize {|el|
        try {du $el.name | get physical | get 0} catch {$el.size}
    }
    | sort-by -r realsize
    | reject size
    | rename --column {realsize: size}
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
def try-notify [command: closure, exitmsg: string, failuremsg: string] {
    try {
        do $command;
        notify-send $exitmsg
    } catch {
        notify-send -u critical $failuremsg
    }
}

# Kills all processes that match with `ps_name`
def killall [ps_name: string] {
    findps $ps_name | get pid | each -k {|id| kill -9 $id}
}

def fastman [command: string] {
    curl $"cheat.sh/($command)"
}

# Nushell uses `watch` for other purpose so create a function that replicates
# bash `watch` behaviour
def bashwatch [command: closure, duration: duration] {
    loop {
        do $command;
        sleep $duration

    }
}

# Yazi integration so cwd is used when exiting yazi
def --env yy [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# Change directory to the notes repo and open neovim
def notes [] {
    cd ~/GitRepos/ObsidianNotes
    nvim .
}

# We need to run jupyter in a very concrete way inside wsl to be consumed from
# the windows host machine
def jupyterwsl [] {
    do {
        let value = (python3 -c "import subprocess; value = subprocess.run(['hostname', '-I'], text=True).stdout") | split column " " | get column1 | first
        jupyter lab --ip $"($value)" --no-browser .
    }
}

# Same as jupyterwsl but using uw
def uvjupywsl [] {
    let value = (uv run python3 -c "import subprocess; value = subprocess.run(['hostname', '-I'], text=True).stdout") | split column " " | get column1 | first
    uv run jupyter lab --ip $"($value)" --no-browser .
}
