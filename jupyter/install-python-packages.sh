#!/bin/bash

# This init script clones a Git repository that contains a `requirements.txt`
# file and installs the listed packages
# Expected parameters : None

# Clone repository and give permissions to the onyxia user
GIT_USER=InseeFrLab
GIT_REPO=sspcloud-init-scripts
git clone --depth 1 https://github.com/${GIT_USER}/${GIT_REPO}.git
chown -R onyxia:users ${GIT_REPO}/

# Install Python packages
pip install -r ${GIT_REPO}/requirements.txt
