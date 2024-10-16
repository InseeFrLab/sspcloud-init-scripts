#!/bin/sh

# This init script is a variation of open-rproj, which clones
# a Git repository that contains a RStudio project (*.Rproj)
# and opens it in RStudio at startup.
# In addition, it takes as parameter the name of the git account and the git repository.

# Expected parameters : 
#  - Name of the github account
#  - Name of the github repository

# Fetch the parameter
GIT_ACCOUNT=$1
GIT_REPO=$2

# Clone repository and give permissions to the onyxia user
git clone --depth 1 https://github.com/${GIT_ACCOUNT}/${GIT_REPO}.git
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
  }
}, action = 'append')
" >> /home/onyxia/.Rprofile