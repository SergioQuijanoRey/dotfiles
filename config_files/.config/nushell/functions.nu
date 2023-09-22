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
