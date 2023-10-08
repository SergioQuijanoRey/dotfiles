require("which-key").setup {

    plugins = {
        presets = {
            -- This presets are too much for me
            -- I know pretty well this vim default bindings
            operators = false,
            motions = false,

            -- I also know this bindings but are more useful to show
            -- Also I don't use them as much as the disabled ones
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        }
    }
}
