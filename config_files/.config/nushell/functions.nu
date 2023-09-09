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
