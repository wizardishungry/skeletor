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
- ** `.gitignore` sensitive data! **
- Run `~/.skel/bin/skeletor.sh`

## Remote Operation
- Be able to login to `user@machine` and have ssh-copy-id installed
- You'll need ssh agent forwarding setup - should work by using the -A option to `skeletor-remote.sh`
- `skeletor-remote.sh user@machine`
  - It'll run ssh-copy-id, `git clone` your .skel repo, and symlink `.skel/*` into `~/`
- Enjoy your new machine without setting up dotfiles or ssh auth by hand
