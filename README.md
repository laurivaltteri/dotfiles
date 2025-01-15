<p align="center"><img src="art/banner-2x.png"></p>

## Introduction
Since the ansible was overkill for configuring local machine here's dotfiles inspired version of setting up (university administered macOS). It's done mostly manually, since Mackup is [not working with Sequoia](https://www.reddit.com/r/MacOS/comments/1f1rdvs/avoid_mackup_if_you_are_runing_sonoma_or_later/).
Copy the up-to-date .dotfiles with [Mackup](https://github.com/lra/mackup).

The original inspiration comes from these:  
- https://yadm.io/#  
- http://dotfiles.github.io/tutorials/  

## Getting started

#### Log in iCloud
Appearance > Dark  
Privacy & Security > Full Disk Access > + > Utilities/Terminal  
Touch ID & Password > Add fingers & Add watch  
Settings > Keyboard > Keyboard Shortcuts.. > Keyboard > Move focus to next Window  
Settings > Keyboard > Input Sources > Edit...  
Settings > iCloud > Drive > Desktop & Document Folders  

#### Simultaneously
Install software from University menu > Managed Software Center  
[Setup Zotero](https://version.helsinki.fi/hipercog/wiki/-/wikis/zotero)  

#### Add iCloud to `$HOME`
```zsh
cd
ln -s "/Users/$USER/Library/Mobile Documents/com~apple~CloudDocs" icloud
```

## Start configuring

#### Color everything (what is not covered by selected .dotfile)
[Catppuccin](https://github.com/orgs/catppuccin/)

#### Set zsh as shell (if for some reason set to bash (university)
```bash
chsh -s /bin/zsh
```
#### Install brew and follow the `fresh.sh` script
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Remember to take the post install steps in zsh.

#### Install apps, kegs, and binaries
Copy and edit the `Brewfile`
```zsh
brew bundle
```
#### Setup the shell
[Shell](https://harshithashok.com/tools/oh-my-zsh-with-starship/)
Add `.zshrc` to `$HOME` (with starship launch)

#### Setup some application

Chrome, Protonmail Bridge, Finicky, Slack..

#### Configure Github Copilot CLI
[Configuration steps](https://docs.github.com/en/copilot/managing-copilot/configure-personal-settings/installing-github-copilot-in-the-cli)

#### Configure VSCode
copy preference files from Mackup
install desired extensions from
Cmd+Shift+P and type 'shell command' to find the Shell Command: Install 'code' command in PATH

#### Run `.macos` 
Run script to set rest of the macOS settings.

#### Configure ultan
[Access ePouta environments](https://wiki.helsinki.fi/X/UI63Gm)
set ssh keys

#### Configure rest of the SSH keys
ssh-keygen -t ed25519 -C "<your_email>"
pbcopy < ~/.ssh/<key>.pub
add the key to services

## Next setup development environments

#### First let's setup python

Add following to `.zshrc`
```zsh
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
```
Install `poetry`
```zsh 
pyenv install <python_ver>
cd <repo_folder>
pip install poetry
```
Initiate virtual environment
```zsh 
poetry shell
poetry install # install the project dependencies
```
Remember that `jupyter` needs to be in poetry dev.dependencies
In VSCode open `.ipynb` file try select kernel, and reboot if not found.
Run smoothly!


#### Finally how about R on VSCode
RStudio is running smoothly. However `renv` is breaking the radian. Clever bypass for installing radian for certain pyenv managed python is to the set `r.rterm.ma` for that version under `/Users/lvahonen/.pyenv/versions/<py_version>/bin/radian`. Other than that runnin lke intended.

---
%% the original







## The original how-to

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy!

📖 - [Read the blog post](https://driesvints.com/blog/getting-started-with-dotfiles)  
📺 - [Watch the screencast on Laracasts](https://laracasts.com/series/guest-spotlight/episodes/1)  
💡 - [Learn how to build your own dotfiles](https://github.com/driesvints/dotfiles#your-own-dotfiles)

If you find this repo useful, [consider sponsoring me](https://github.com/sponsors/driesvints) (a little bit)! ❤️ 

## A Fresh macOS Setup

These instructions are for setting up new Mac devices. Instead, if you want to get started building your own dotfiles, you can [find those instructions below](#your-own-dotfiles).

### Backup your data

If you're migrating from an existing Mac, you should first make sure to backup all of your existing data. Go through the checklist below to make sure you didn't forget anything before you migrate.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Setting up your Mac

After backing up your old Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences
2. Setup an SSH key by using one of the two following methods  
   2.1. If you use 1Password, install it with the 1Password [SSH agent](https://developer.1password.com/docs/ssh/get-started/#step-3-turn-on-the-1password-ssh-agent) and sync your SSH keys locally.  
   2.2. Otherwise [generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/driesvints/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone --recursive git@github.com:driesvints/dotfiles.git ~/.dotfiles
    ```

4. Run the installation with:

    ```zsh
    cd ~/.dotfiles && ./fresh.sh
    ```

5. Start `Herd.app` and run its install process
6. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
7. Restart your computer to finalize the process

Your Mac is now ready to use!

> 💡 You can use a different location than `~/.dotfiles` if you want. Make sure you also update the references in the [`.zshrc`](./.zshrc#L2) and [`fresh.sh`](./fresh.sh#L20) files.

### Cleaning your old Mac (optionally)

After you've set up your new Mac you may want to wipe and clean install your old Mac. Follow [this article](https://support.apple.com/guide/mac-help/erase-and-reinstall-macos-mh27903/mac) to do that. Remember to [backup your data](#backup-your-data) first!

## Your Own Dotfiles

**Please note that the instructions below assume you already have set up Oh My Zsh so make sure to first [install Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#getting-started) before you continue.**

If you want to start with your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://formulae.brew.sh/cask/) to check if the app you want to install is available.

Check out the [`aliases.zsh`](./aliases.zsh) file and add your own aliases. If you need to tweak your `$PATH` check out the [`path.zsh`](./path.zsh) file. These files get loaded in because the `$ZSH_CUSTOM` setting points to the `.dotfiles` directory. You can adjust the [`.zshrc`](./.zshrc) file to your liking to tweak your Oh My Zsh setup. More info about how to customize Oh My Zsh can be found [here](https://github.com/robbyrussell/oh-my-zsh/wiki/Customization).

When installing these dotfiles for the first time you'll need to backup all of your settings with Mackup. Install Mackup and backup your settings with the commands below. Your settings will be synced to iCloud so you can use them to sync between computers and reinstall them when reinstalling your Mac. If you want to save your settings to a different directory or different storage than iCloud, [checkout the documentation](https://github.com/lra/mackup/blob/master/doc/README.md#storage). Also make sure your `.zshrc` file is symlinked from your dotfiles repo to your home directory. 

```zsh
brew install mackup
mackup backup
```

You can tweak the shell theme, the Oh My Zsh settings and much more. Go through the files in this repo and tweak everything to your liking.

Enjoy your own Dotfiles!

## Thanks To...

I first got the idea for starting this project by visiting the [GitHub does dotfiles](https://dotfiles.github.io/) project. Both [Zach Holman](https://github.com/holman/dotfiles) and [Mathias Bynens](https://github.com/mathiasbynens/dotfiles) were great sources of inspiration. [Sourabh Bajaj](https://twitter.com/sb2nov/)'s [Mac OS X Setup Guide](http://sourabhbajaj.com/mac-setup/) proved to be invaluable. Thanks to [@subnixr](https://github.com/subnixr) for [his awesome Zsh theme](https://github.com/subnixr/minimal)! Thanks to [Caneco](https://twitter.com/caneco) for the header in this readme. And lastly, I'd like to thank [Emma Fabre](https://twitter.com/anahkiasen) for [her excellent presentation on Homebrew](https://speakerdeck.com/anahkiasen/a-storm-homebrewin) which made me migrate a lot to a [`Brewfile`](./Brewfile) and [Mackup](https://github.com/lra/mackup).

In general, I'd like to thank every single one who open-sources their dotfiles for their effort to contribute something to the open-source community.
