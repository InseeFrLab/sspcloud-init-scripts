#!/bin/bash

# This init script is used for defining personnal keyboard shortcuts in VSCode.
# Expected parameters : None

# Add shortcuts
echo '[
    {
        "key": "ctrl+shift+d",
        "command": "editor.action.duplicateSelection"  # Duplicate a line
    },
    {
        "key": "ctrl+d",
        "command": "editor.action.deleteLines",  # Delete a line
        "when": "editorTextFocus"
    }
]' > "$HOME/.local/share/code-server/User/keybindings.json"
