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
copilotVersion="1.234.0"
copilotChatVersion="0.20.0" # This version is not compatible with VSCode server 1.92.2

wget --retry-on-http-error=429 https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot/${copilotVersion}/vspackage -O copilot.vsix.gz
wget --retry-on-http-error=429 https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot-chat/${copilotChatVersion}/vspackage -O copilot-chat.vsix.gz

gzip -d copilot.vsix.gz 
gzip -d copilot-chat.vsix.gz 

code-server --install-extension copilot.vsix
code-server --install-extension copilot-chat.vsix
rm copilot.vsix copilot-chat.vsix
