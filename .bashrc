#!/bin/bash

# Source bash configuration files
source "${HOME}/.bash/sensible.bash"
source "${HOME}/.bash/aliases.bash"
source "${HOME}/.bash/config.bash"
source "${HOME}/.git_helpers/.git_helpers"
#source "${HOME}/.bash/env.bash"

# Add Swift toolchain to PATH
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"

# Add Android SDK tools to PATH
export PATH=/Users/mark/Library/Android/sdk/build-tools/28.0.3:"${PATH}"

# NVM configuration
export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="${PATH}:${HOME}/.rvm/bin"
