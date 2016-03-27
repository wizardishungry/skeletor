#!/usr/bin/env bash
if [ "$#" -ne 1 ]; 
    then echo Usage: "$0 [user]@machine"
    exit
    fi
set -v
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
cd `git rev-parse --show-toplevel`
NAME=`basename $PWD`
set -f
ssh-copy-id $@
ssh $@ ls $NAME 2> /dev/null && exit "Directory $NAME already exists on $@"
ssh $@ git clone `git config --get remote.origin.url` $NAME
ssh $@ mv .ssh .ssh.bak \&\& chmod -R g-rw .ssh/ \&\& $NAME/bin/skeletor.sh
ssh $@ uname -a \&\& echo "Skeletor worked"
