#!/bin/bash

# This init script presents various ways of installing Python packages
# Works for both JupyterLab and VSCode services
# Expected parameters : None

# Clone repository and give permissions to the onyxia user
GIT_REPO=sspcloud-init-scripts
git clone --depth 1 https://github.com/InseeFrLab/${GIT_REPO}.git
chown -R onyxia:users ${GIT_REPO}/

# Install Python packages using `pip`
pip install matplotlib plotly

# Install Python packages using `pip` and a `requirements.txt` file
pip install -r ${GIT_REPO}/inputs/requirements.txt

# Install Python packages using `conda`
conda install requests scipy
