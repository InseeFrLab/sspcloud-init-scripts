#!/bin/sh

# This init script install VScode extensions provided as args
# Only the extensions from the Open VSX Registry can be installed on code-server
# Expected parameters : a space separated list of extensions

# Check if no arguments are provided
if [ "$#" -ge 1 ]; then
  # Loop over all the provided arguments (extensions)
  for extension in "$@"
  do
      echo "Installing extension: $extension"

      # Install the extension using code-server
      code-server --install-extension "$extension"

      # Check if the installation was successful
      if [ $? -eq 0 ]; then
          echo "Successfully installed $extension"
      else
          echo "Failed to install $extension"
      fi
  done
fi
