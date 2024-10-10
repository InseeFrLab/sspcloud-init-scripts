#!/bin/bash

# This init script upate settings of vscode. Many example of options are displayed.
# Expected parameters : None

# Path to the VSCode settings.json file
SETTINGS_FILE="$HOME/.config/Code/User/settings.json"

# Check if the settings.json file exists, otherwise create a new one
if [ ! -f "$SETTINGS_FILE" ]; then
    echo "No existing settings.json found. Creating a new one."
    mkdir -p "$(dirname "$SETTINGS_FILE")"
    echo "{}" > "$SETTINGS_FILE"  # Initialize with an empty JSON object
fi

# Add or modify Python-related settings using jq
# We will keep the comments outside the jq block, as jq doesn't support comments inside JSON.
jq '. + {
    "workbench.colorTheme": "Default Dark Modern"   # Set the theme
    "python.linting.enabled": true,                 # Enable linting in Python files
    "python.linting.pylintEnabled": true,           # Enable Pylint for linting
    "python.linting.flake8Enabled": true,           # Enable Flake8 for additional linting
    "python.linting.mypyEnabled": true,             # Enable MyPy for static type checking

    "python.formatting.provider": "black",          # Use Black as the code formatter
    "python.formatting.blackArgs": ["--line-length", "88"],  # Additional arguments for Black

    "python.testing.pytestEnabled": true,           # Enable Pytest for running tests

    "python.analysis.typeCheckingMode": "basic",    # Set the type checking mode to "basic"
    "python.analysis.autoSearchPaths": true,        # Enable automatic search for imports
    "python.analysis.useLibraryCodeForTypes": true, # Use types provided by libraries

    "editor.formatOnSave": true,                    # Automatically format code when saving
    "editor.tabSize": 4,                            # Set tab size to 4 spaces
    "editor.insertSpaces": true,                    # Convert tabs to spaces
    "editor.rulers": [80],                          # Add a ruler at 80 characters
    "files.trimTrailingWhitespace": true,           # Automatically trim trailing whitespace
    "files.insertFinalNewline": true,               # Ensure files end with a newline

    "editor.codeActionsOnSave": {
        "source.organizeImports": true              # Automatically organize imports on save
    }
}' "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"


