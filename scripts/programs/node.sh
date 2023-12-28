#!/bin/bash

# Install Node
# sudo apt install nodejs
# sudo apt install npm           # in many cases, npm is shipped with node
# sudo npm install --global yarn # optional

# =======================
# Install Node with fnm
# =======================
curl -fsSL https://fnm.vercel.app/install | bash

fnm install 18
