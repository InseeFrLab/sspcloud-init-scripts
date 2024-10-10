#!/bin/bash

# This init script updates settings of VSCode. Many example of options are displayed.
# See here for the default settings enforced in Onyxia's VSCode-based images : https://github.com/InseeFrLab/images-datascience/blob/main/vscode/settings/User.json 
# Expected parameters : None

# Path to the VSCode settings.json file
SETTINGS_FILE="${HOME}/.local/share/code-server/User/settings.json"

# Check if the settings.json file exists, otherwise create a new one
if [ ! -f "$SETTINGS_FILE" ]; then
    echo "No existing settings.json found. Creating a new one."
    mkdir -p "$(dirname "$SETTINGS_FILE")"
    echo "{}" > "$SETTINGS_FILE"  # Initialize with an empty JSON object
fi

# Add or modify Python-related settings using jq
# We will keep the comments outside the jq block, as jq doesn't support comments inside JSON.
jq '. + {
    "workbench.colorTheme": "Default Dark Modern",  # Set the theme

    "editor.rulers": [80, 100, 120],  # Add specific vertical rulers
    "files.trimTrailingWhitespace": true,  # Automatically trim trailing whitespace
    "files.insertFinalNewline": true,  # Ensure files end with a newline

    "flake8.args": [
        "--max-line-length=100"  # Max line length for Python linting
    ]
}' "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
