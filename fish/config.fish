set fish_greeting """"""

alias asdf "brew update && brew upgrade && rustup update"
alias s "eza --all --long --sort type --git --header --icons --color-scale --context --git-repos"
alias t "eza -a --tree --level"
alias remove "rm -rf ~/.local/share/nvim/swap && rm ~/.local/state/nvim/lsp.log && rm -rf ~/.local/state/nvim/swap"
alias cdp "cd ../"
alias v nvim
alias vr "nvim ./src/main.rs"

alias gk "git add . && git commit && git push"
alias hist "git log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all"
alias llog "git log --graph --name-status --pretty=format:\"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset\" --date=relative"

alias crun "gcc main.c && ./a.out"
alias rp "eval (history | head -n 1)"

function mkcd
    mkdir -p $argv
    cd $argv
end

# Homebrew
export HOMEBREW_NO_ENV_HINTS

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$PATH:$BUN_INSTALL/bin"
export PATH="$PATH:$HOME/Documents/softwares/iit/target/debug"

# Rust
source "$HOME/.cargo/env.fish"

clear
