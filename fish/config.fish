set fish_greeting """"""

alias asdf "brew update && brew upgrade"
alias l "eza -a -l -s type --git --header --icons --no-user --no-time --color-scale --context --git-repos"
alias t "eza -a --tree --level"
alias remove "rm -rf ~/.local/share/nvim/swap && rm ~/.local/state/nvim/lsp.log && rm -rf ~/.local/state/nvim/swap"
alias cdp "cd ../"
alias v nvim
alias c clear

function mkcd
    mkdir -p $argv
    cd $argv
end

# Git related
alias ga "git add"
alias gaa "git add ."
alias gci "git commit"
alias gp "git push origin \$(git rev-parse --abbrev-ref HEAD)"
alias gpf "git push origin \$(git rev-parse --abbrev-ref HEAD) -f"
alias gpl "git pull origin \$(git rev-parse --abbrev-ref HEAD)"

alias gco "git checkout"
alias gbr "git branch"
alias gst "git status"
alias gd "git diff"

alias hist "log --pretty=format:\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\" --graph --date=relative --decorate --all"
alias llog "log --graph --name-status --pretty=format:\"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset\" --date=relative"

alias gv "git add . && git commit && git push"

clear
