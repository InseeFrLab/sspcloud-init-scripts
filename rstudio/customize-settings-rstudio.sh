#!/bin/sh

# This init script updates settings of RStudio by modifying the `restudio-prefs.json` file.
# Configurations are documented below.
# Expected parameters : None

cat << EOF > ~/.config/rstudio/rstudio-prefs.json
{
    "num_spaces_for_tab": 4,
    "insert_native_pipe_operator": true,
    "margin_column": 100,
    "auto_append_newline": true,
    "strip_trailing_whitespace": true,
    "auto_save_on_blur": true,
    "check_arguments_to_r_function_calls": true,
    "check_unexpected_assignment_in_function_call": true,
    "warn_variable_defined_but_not_used": true,
    "style_diagnostics": true,
    "editor_theme": "Vibrant Ink",
    "posix_terminal_shell": "bash"
}
EOF

chown -R onyxia:users ~/.config/

# num_spaces_for_tab: Number of spaces used for indentation when pressing Tab
# insert_native_pipe_operator: Automatically insert the native R pipe operator (%>%) when typing '|>'
# margin_column: Column number at which a margin line is displayed in the editor
# auto_append_newline: Automatically add a newline at the end of the file on save
# strip_trailing_whitespace: Remove trailing whitespace on save
# auto_save_on_blur: Automatically save files when the editor loses focus
# check_arguments_to_r_function_calls: Enable argument matching checks for R function calls
# check_unexpected_assignment_in_function_call: Warn about unintended assignments within function calls
# warn_variable_defined_but_not_used: Warn if a variable is defined but not used
# style_diagnostics: Enable diagnostics for style issues in the editor
# editor_theme: Theme applied to the editor (e.g., syntax highlighting)
# posix_terminal_shell: Default shell used in the terminal for POSIX systems
