#!/bin/sh

# This init script updates settings of R by modifying the user `Rprofile.`
# Expected parameters : None

cat << EOF > ~/.Rprofile
# Uncomment sections to customize R options

# Customize console prompt, digit display, and continuation prompt
# options(
#   repos = c(CRAN = 'https://cran.rstudio.org')  # Custom CRAN repository
#   prompt = 'R> ',      # Custom prompt
#   digits = 4,          # Limit numeric precision to 4 digits
#   continue = '+++ '    # Continuation prompt
# )
EOF

chown -R onyxia:users ~/.Rprofile
