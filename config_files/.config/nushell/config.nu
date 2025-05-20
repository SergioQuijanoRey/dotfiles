# Changes to the default config
# There are a lot of more config values, but I was not interested in changing everything
$env.config = {
    show_banner: false

    completions: {
        # I prefer the fuzzy algorithm instead of the classic
        algorithm: "fuzzy"    # prefix or fuzzy
    }

    edit_mode: "emacs"

    # I want my cursor to be always a block
    cursor_shape: {
        emacs: block
        vi_insert: block
        vi_normal: block
    }

    hooks: {
        # Run before the prompt is show
        # NOTE: Allow direnv to work with nushell
        pre_prompt: [{ ||
          if (which direnv | is-empty) {
            return
          }

          direnv export json | from json | default {} | load-env
        }]
    }
}

# Load the work enviroment
# NOTE: this must be before third party integrations so we have properly set $env.PATH
source ($nu.default-config-dir | path join 'work_machine.nu')

# Load the aliases
source ($nu.default-config-dir | path join 'aliases.nu')

# Load custom functions
source ($nu.default-config-dir | path join 'functions.nu')

# Load third party integrations
source ($nu.default-config-dir | path join 'integrations_create_files.nu')
source ($nu.default-config-dir | path join 'integrations_load.nu')

# Now that we have the prompt program, we can change it
source ($nu.default-config-dir | path join 'prompt.nu')
