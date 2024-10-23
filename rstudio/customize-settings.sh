#!/bin/sh

# This init script updates settings of Rsudio. Various examples of options are displayed.
# Expected parameters : None

touch ~/.Rprofile

# Set a theme and displays the console on the right
echo \
"
setHook('rstudio.sessionInit', function(newSession) {
  if (newSession && identical(getwd(), '${WORKSPACE_DIR}'))
  {
    # For a slick dark theme (⌐■_■)
    rstudioapi::applyTheme('Merbivore')
    # Console on the right
    rstudioapi::executeCommand('layoutConsoleOnRight')
  }
}, action = 'append')

# Set CRAN mirror
# options(repos = c(CRAN = 'https://cran.rstudio.org'))

# Customize console prompt, digit display, and continuation prompt
options(
  prompt = 'R> ',      # Custom prompt
  digits = 4,          # Limit numeric precision to 4 digits
  continue = '+++ '    # Continuation prompt
)
" >> ~/.Rprofile
