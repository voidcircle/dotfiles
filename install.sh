/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(
  echo
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
) >>/Users/voidsupernova/.zprofile && eval "$(/opt/homebrew/bin/brew shellenv)"

brew install --cask google-chrome iterm2 github

brew install neovim node git npm bat fish

curl -fsSL https://bun.sh/install | bash

git clone git@github.com:voidsupernova/dotfiles.git ~/.config

mv ~/.config/.gitconfig ~/.gitconfig

fish

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fisher install IlanCosman/tide@v5
fisher install jethrokuan/z
fisher install jorgebucaran/autopair.fish

cd ~/.local/share/vim/site/pack/deps/opt/markdown-preview.nvim

bun install

cd ./app

sh ./install.sh

ssh-keygen -t ed25519 -C "your email"

sudo -s -H eval "$(ssh-agent -s)"

touch ~/.ssh/config

echo "Host github.com
AddKeysToAgent yes
UseKeychain yes
IdentityFile ~/.ssh/id_ed25519
" >~/.ssh/config/

pbcopy <~/.ssh/id_ed25519.pub

echo """
1. Go to https://github.com/settings/ssh/new
2. Set the title to anything you want it to be called. You will never see it later unless you get a new device.
3. Paste the key into the content box. The command you just ran in the previous step must have copied your key.
4. Click the Add SSH Key button.
5. You Should get an email from GitHub saying a new SSH Key has recently been added.
"""
