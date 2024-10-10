#!/bin/bash

# This init script upate settings of vscode. Many example of options are displayed.
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
    ],

    "cSpell.language": "en,fr",  # Languages for spell check
    # Exceptions on file extensions for spell check
    "cSpell.enableFiletypes": [  
        "!jupyter",
        "!python",
        "!r",
        "!json",
        "!yaml"
    ]
}' "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"

