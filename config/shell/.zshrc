# Use antigen
source ~/antigen.zsh

# Use Oh-My-Zsh
antigen use oh-my-zsh

# Set plugins from the default repo (oh-my-zsh)
antigen bundle git
antigen bundle command-not-found
# antigen bundle docker
antigen bundle z

# Set plugins from external repos
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle unixorn/fzf-zsh-plugin@main

# Set theme
antigen theme denysdovhan/spaceship-prompt

# Apply changes
antigen apply

# Test if ~/.aliases exists and source it
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# fnm
export PATH="$HOME/.local/share/fnm:$PATH"
eval "`fnm env`"
