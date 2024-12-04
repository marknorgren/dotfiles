#!/bin/zsh

# # Export PATH efficiently, avoid duplication
export PATH="$HOME/bin:/usr/local/bin:$PATH"

# # Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# # Set a fixed theme for faster load, remove if using 'random' theme is not needed
export ZSH_THEME="robbyrussell"

# # Enable plugins (only keep essential ones for faster startup)
export plugins=(git)

# # Source oh-my-zsh
source "$ZSH/oh-my-zsh.sh"
source "${HOME}/working/dotfiles/zshrc.sh"

# # Lazy loading of nvm, pyenv, asdf
autoload -U add-zsh-hook

# # nvm
# load_nvm() {
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# }
# #add-zsh-hook precmd load_nvm

# # pyenv
# load_pyenv() {
#   export PYENV_ROOT="$HOME/.pyenv"
#   command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init -)"
# }
# #add-zsh-hook precmd load_pyenv

# # asdf
# load_asdf() {
#   . /opt/homebrew/opt/asdf/libexec/asdf.sh
# }
# #add-zsh-hook precmd load_asdf



# # Aliases
alias ytdl="yt-dlp -S res,ext:mp4:m4a --recode mp4"

# # Fix potential syntax error in original file by ensuring commands are properly separated

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/mark/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/mark/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/mark/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/mark/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# CocoaPods requires your terminal to be using UTF-8 encoding.
export LC_ALL=en_US.UTF-8
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


## GO
export PATH="$PATH:$HOME/go/bin"


## dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet


## python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/mark/.cache/lm-studio/bin"
