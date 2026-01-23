#!/bin/sh

# This init script install various useful VScode extensions
# NB : only extensions from the Open VSX Registry (https://open-vsx.org/) can be installed on code-server
# Expected parameters : None

# CONFORT EXTENSIONS -----------------

# Colorizes the indentation in front of text
code-server --install-extension oderwat.indent-rainbow
# Extensive markdown integration
code-server --install-extension yzhang.markdown-all-in-one
# Integrates Excalidraw (software for sketching diagrams)
code-server --install-extension pomdtr.excalidraw-editor

# COPILOT ----------------------------

# Install Copilot (Microsoft's AI-assisted code writing tool)
# Compatible versions with code-server v4.108.1
copilotChatVersion="0.31.1"
copilotVersion="1.388.0"

wget --retry-on-http-error=429 https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot/${copilotVersion}/vspackage -O copilot.vsix.gz
wget --retry-on-http-error=429 https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot-chat/${copilotChatVersion}/vspackage -O copilot-chat.vsix.gz

gzip -d copilot.vsix.gz 
gzip -d copilot-chat.vsix.gz 

code-server --install-extension copilot.vsix
code-server --install-extension copilot-chat.vsix

# Force those settings to make completions work
cat << 'EOF' > ~/.local/share/code-server/User/settings.json
{
  "security.workspace.trust.enabled": false,
  "security.workspace.trust.startupPrompt": "never",
  "terminal.integrated.inheritEnv": false,
  "git.defaultCloneDirectory": "~/work",
  "python.testing.pytestEnabled": true,
  "flake8.args": [
    "--max-line-length=100"
  ],
  "redhat.telemetry.enabled": false,
  "julia.symbolCacheDownload": true,
  "julia.enableTelemetry": false,
  "r.bracketedPaste": true,
  "cSpell.language": "en,fr",
  "cSpell.enableFiletypes": [
    "!jupyter",
    "!python",
    "!r",
    "!json",
    "!yaml"
  ],
  "[latex]": {
    "editor.wordWrap": "on"
  },
  "chat.disableAIFeatures": false,
  "workbench.colorTheme": "Default Dark Modern",
  "yaml.schemas": {
    "file:///home/onyxia/.local/share/code-server/extensions/continue.continue-1.3.29-linux-x64/config-yaml-schema.json": [
      ".continue/**/*.yaml"
    ]
  },
  "github.copilot.nextEditSuggestions.enabled": true,
  "chat.extensionUnification.enabled": false,
  "github.copilot.enable": {
    "quarto": false,
    "*": true
  }
}
EOF

rm copilot.vsix copilot-chat.vsix
