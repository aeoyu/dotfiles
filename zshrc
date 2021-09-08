# Disable weird pasting error
DISABLE_MAGIC_FUNCTIONS=true
# https://scriptingosx.com/2019/07/moving-to-zsh-part-5-completions/
# use bash completions
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
setopt histignorespace

# Always use color output for `ls`
alias ls="exa -l --group-directories-first -s type"
alias l="exa -l --group-directories-first -s type"
# go to project root
alias r='cd $(git rev-parse --show-toplevel)'
alias g='git'
alias k='kubectl'
alias cat='bat'
alias rg="rg --hidden"
alias yt="youtube-dl"

. /Users/filora/.nix-profile/etc/profile.d/nix.sh

# setup base16-shell for color themes
BASE16_SHELL=$HOME/.config/base16-shell
[[ -n "$PS1" ]] && [[ -s $BASE16_SHELL/profile_helper.sh ]] && eval "$($BASE16_SHELL/profile_helper.sh)"