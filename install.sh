echo "Installing homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing applications..."

brew install --cask google-chrome iterm2 github font-hack-nerd-font

echo "Installing development tools..."

brew install neovim node git npm bat fish eza

echo "Installing lsps, linters, formatters..."

brew install rust rustup lua-language-server shfmt biome prettier black stylua

echo "Installing bun..."

curl -fsSL https://bun.sh/install | bash

echo "Installing dotfiles..."

git clone git@github.com:voidsupernova/dotfiles.git ~/.config
mv ~/.config/.gitconfig ~/.gitconfig

fish

echo "Installing fish plugin manager..."

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

echo "Installing fish plugins..."

fisher install IlanCosman/tide@v5
fisher install jethrokuan/z
fisher install jorgebucaran/autopair.fish

echo "Setting up markdown preview..."

cd ~/.local/share/nvim/site/pack/deps/opt/markdown-preview.nvim

bun install

cd ./app

sh ./install.sh

echo "Setting up ssh..."

ssh-keygen -t ed25519 -C "voidcircle080111@gmail.com"

sudo -s -H eval "$(ssh-agent -s)"

touch ~/.ssh/config

echo "Host github.com
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_ed25519
" >~/.ssh/config

pbcopy <~/.ssh/id_ed25519.pub

open -a Google\ Chrome https://github.com/settings/ssh/new

echo """
1. Go to https://github.com/settings/ssh/new
2. Set the title to anything you want it to be called. You will never see it later unless you get a new device.
3. Paste the key into the content box. The command you just ran in the previous step must have copied your key.
4. Click the Add SSH Key button.
5. You Should get an email from GitHub saying a new SSH Key has recently been added.

1. Change the fonts from the default font to $(Hack Nerd Font Mono). It will enable iTerm to render icons instead of squared question marks.
"""

ln -sv ~/.config/.gitconfig ~/.gitconfig
