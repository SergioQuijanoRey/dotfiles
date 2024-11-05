# NOTE: this is the first file that is loaded. Then, `config.nu` is loaded
# In this file there should be the file creation logic
# By default try to put all the logic in the config.nu file

# Create the files that are required for the integrations
# NOTE: this step must be executed here and not in `config.nu`
source ($nu.default-config-dir | path join 'integrations_create_files.nu')

# First change the look of the prompt
source ($nu.default-config-dir | path join 'prompt.nu')
