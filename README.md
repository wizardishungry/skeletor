# Skeletor

Commands for keeping your dotfiles in git.
- `update-dotfiles` - maintain symlinks between a 
- `skeletor.sh` - entry point for update-dotfiles
- `skeletor-remote.sh` - move 

Should work on OS X, Linux and OpenBSD.

## Local Setup

- Fork this repo
- Do a checkout of your fork to `~/.skel`
- Put additional dotfiles in there
- **Always `.gitignore` sensitive data!**
- Run `~/.skel/bin/skeletor.sh`

## Remote Operation
- Be able to login to `user@machine` and have ssh-copy-id installed
- You'll need ssh agent forwarding setup - should work by using the -A option to `skeletor-remote.sh`
- `skeletor-remote.sh user@machine`
  - `ssh-copy-id` copies over your ssh key for the initial setup
  - `git clone` installs your .skel repo
  - The old `.ssh` dir is saved to .ssh/.bak
  - We symlink `.skel/*` into `~/`
- Enjoy your new machine without setting up dotfiles or ssh auth by hand

## Warnings
- If you mess up your `.ssh` directory, you can lock yourself out of your account. I reccomend keeping password authentication on one privileged account in case you nuke your `authorized_keys`
![I wanted an excuse to use this image](http://www.he-manreviewed.com/wp-content/uploads/2014/04/245-20-7-Years-Bad-Luck-Gif.gif)
