#!/usr/bin/env bash
cd `dirname $0`/..
SKEL="${HOME}/.skel"
CWD=`pwd`
if [ "$SKEL" != "$CWD" ]
then
    echo "skel git repo is not in $SKEL"
    exit 1;
fi

if [ ! -d ".git" ]
then
    echo "$SKEL is not a git repository; continuing anyway since you might be on a shitty platform"
fi


. ~/.skel/skeletor-ostype/$OSTYPE

~/.skel/bin/update-dotfiles $SKEL > /dev/null

cd ~/.skel

#todo add more hook automation
ln -s ../../hooks/post-merge .git/hooks
