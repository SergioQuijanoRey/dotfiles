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


# Load third party integrations
source ($nu.default-config-dir | path join 'integrations_load.nu')

# Load the aliases
source ($nu.default-config-dir | path join 'aliases.nu')

# Load custom functions
source ($nu.default-config-dir | path join 'functions.nu')
