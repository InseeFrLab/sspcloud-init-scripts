#!/bin/sh

# This init script clones a Git repository that contains a RStudio project (*.Rproj)
# and opens it in RStudio at startup

REPO_URL=https://github.com/avouacr/learnr-onyxia.git
WORK_DIR=/home/onyxia/work
TUTO_DIR=${WORK_DIR}/tutoriel

# Clone the repository and give permissions to the onyxia user 
git clone $REPO_URL $TUTO_DIR
chown -R onyxia:users $TUTO_DIR

# Open the project
echo \
"
setHook('rstudio.sessionInit', function(newSession) {
  if (newSession && identical(getwd(), '${WORK_DIR}'))
  {
    message('Activation du projet RStudio')
    rstudioapi::openProject('${TUTO_DIR}')
  }
}, action = 'append')
" >> /home/onyxia/.Rprofile
