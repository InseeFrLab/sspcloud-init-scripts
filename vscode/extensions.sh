# CONFORT EXTENSIONS -----------------

code-server --install-extension oderwat.indent-rainbow
code-server --install-extension yzhang.markdown-all-in-one

# COPILOT ----------------------------
echo "Installing copilot extension"

copilotVersion="1.171.0"
copilotChat="0.13.0"

wget --retry-on-http-error=429 "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot/${copilotVersion}/vspackage" -O copilot.vsix.gz
wget --retry-on-http-error=429 https://marketplace.visualstudio.com/_apis/public/gallery/publishers/GitHub/vsextensions/copilot-chat/${copilotChat}/vspackage -O copilot-chat.vsix.gz

code-server --install-extension copilot.vsix
rm copilot.vsix

code-server --install-extension copilot-chat.vsix
rm copilot-chat.vsix