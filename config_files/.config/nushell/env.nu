$env.config = {
    show_banner: false

    completions: {
        # `prefix` or `fuzzy`
        algorithm: "fuzzy"
    }
}

# Left prompt is going to be set using `starship`
$env.STARSHIP_SHELL = "nu"
def create_left_prompt [] {
    starship prompt
}

# Display date time in the right promp, no need for starship
def curr_date [] {$"📅(date now | format date '%d/%m/%Y')"}
def curr_time [] {$"🕐(date now | format date '%H:%M')"}
def create_right_prompt [] {$"(curr_date) (curr_time)"}

# Use that functions to display the prompt
$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }

# How the prompt is shown depending on the prompt mode
$env.PROMPT_INDICATOR = {|| "" }
$env.PROMPT_INDICATOR_VI_INSERT = {|| "vi: " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| "vi " }
$env.PROMPT_MULTILINE_INDICATOR = {|| "::~> " }
