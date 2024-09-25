#!/bin/sh

# This init script presents various ways of installing R packages
# Expected parameters : None

# Clone repository and give permissions to the onyxia user
GIT_REPO=sspcloud-init-scripts
git clone --depth 1 https://github.com/InseeFrLab/${GIT_REPO}.git
chown -R onyxia:users ${GIT_REPO}/

# Install the remote package (needed for remotes install)
Rscript -e "install.packages('remotes')"

# Install from a `DESCRIPTION` file that specifies project dependencies
# See https://r-pkgs.org/description.html for more info
PROJECT_DIR="${GIT_REPO}/examples"
Rscript -e "remotes::install_deps('${PROJECT_DIR}')"

# Install from a `renv` lockfile
# See https://rstudio.github.io/renv/articles/renv.html for more info
Rscript -e "install.packages('renv')"
Rscript -e "renv::restore('${PROJECT_DIR}')"

# Install from 
# See https://remotes.r-lib.org/reference/install_github.html for more info
# See https://remotes.r-lib.org/reference/install_gitlab.html for the equivalent GitLab function
Rscript -e "remotes::install_github('tidyverse/ggplot2')"
