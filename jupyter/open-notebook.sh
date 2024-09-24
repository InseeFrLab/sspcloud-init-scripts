#!/bin/bash

# This init script clones a Git repository that contains a Jupyter notebook
# named `tutorial.ipynb` and opens it in Jupyter Lab at startup
# Expected parameters : None

# Clone Git repository
git clone --depth 1 https://github.com/InseeFrLab/sspcloud-init-scripts.git

# Open the relevant notebook when starting Jupyter Lab
echo "c.LabApp.default_url = '/lab/tree/sspcloud-init-scripts/tutorial.ipynb'" >> /home/onyxia/.jupyter/jupyter_server_config.py
