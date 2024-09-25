#!/bin/sh

# This init script clones a Git repository that open RStudio on a specific file at startup
# Expected parameters : None

# Clone repository and give permissions to the onyxia user
GIT_REPO=sspcloud-init-scripts
git clone --depth 1 https://github.com/InseeFrLab/${GIT_REPO}.git
chown -R onyxia:users ${GIT_REPO}/

# Open the project
FILE_TO_OPEN=${WORKSPACE_DIR}/${GIT_REPO}/inputs/report.qmd
echo \
"
setHook('rstudio.sessionInit', function(newSession) {
  if (newSession && identical(getwd(), '${WORKSPACE_DIR}'))
  {
    message('Activation du projet RStudio')
    rstudioapi::navigateToFile('${FILE_TO_OPEN}')
  }
}, action = 'append')
" >> /home/onyxia/.Rprofile
