source ~/.bash/sensible.bash
source ~/.bash/aliases.bash
source ~/.bash/config.bash
source ~/.git_helpers/.git_helpers
#source ~/.bash/env.bash

export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:"${PATH}"


# apksigner
export PATH=/Users/mark/Library/Android/sdk/build-tools/28.0.3:"${PATH}"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
