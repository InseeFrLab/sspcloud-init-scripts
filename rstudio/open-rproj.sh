#!/bin/sh

# This init script clones a Git repository that contains a RStudio project (*.Rproj)
# and opens it in RStudio at startup
# Expected parameters : None

# Clone repository and give permissions to the onyxia user
GIT_REPO=sspcloud-init-scripts
git clone --depth 1 https://github.com/InseeFrLab/${GIT_REPO}.git
chown -R onyxia:users ${GIT_REPO}/

# Open the project
WORK_DIR='/home/onyxia/work'
PROJECT_DIR=${WORK_DIR}/${GIT_REPO}/examples
echo \
"
setHook('rstudio.sessionInit', function(newSession) {
  if (newSession && identical(getwd(), '${WORK_DIR}'))
  {
    message('Activation du projet RStudio')
    rstudioapi::openProject('${PROJECT_DIR}')
  }
}, action = 'append')
" >> /home/onyxia/.Rprofile
