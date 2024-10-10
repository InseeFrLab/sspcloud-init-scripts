#!/bin/sh

# This init script is a variation of open-rproj, which clones
# a Git repository that contains a RStudio project (*.Rproj)
# and opens it in RStudio at startup.
# In addition, it takes as parameter the name of the git repo.
# This makes it easier to have one such init script for all your
# projects, and just pass the repo as a parameter.
# Additionnaly, it customizes the Rsudio UI theme (here with
# Merbivore) and sets the console to the right
# Expected parameters : Name of the github repo

# Fetch the parameter
GIT_REPO=$1

# Clone repository and give permissions to the onyxia user
git clone --depth 1 https://github.com/InseeFrLab/${GIT_REPO}.git
chown -R onyxia:users ${GIT_REPO}/

# Open the project
PROJECT_DIR=${WORKSPACE_DIR}/${GIT_REPO}/inputs
echo \
"
setHook('rstudio.sessionInit', function(newSession) {
  if (newSession && identical(getwd(), '${WORKSPACE_DIR}'))
  {
    message('Activation du projet RStudio')
    rstudioapi::openProject('${PROJECT_DIR}')
    # For a slick dark theme (⌐■_■)
    rstudioapi::applyTheme('Merbivore')
    # Console on the right (where it should be ;-)
    rstudioapi::executeCommand('layoutConsoleOnRight')
  }
}, action = 'append')
" >> /home/onyxia/.Rprofile
