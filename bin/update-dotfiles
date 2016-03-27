#!/usr/bin/env bash
set -f

if [ ! -d $1 ]
then
    echo "usage: $0 directory"
    exit 1
fi
cd $1/..

find=find
if [ `uname` = OpenBSD ]
 then
    echo openbsd
    find=gfind
fi

for NAME in $($find `basename $1` -maxdepth 1 -mindepth 1 -name .\* \! -name .git \! -name .gitmodules \! -name .svn  \! -name .. \! -name . \! -name \*.sw?)
do
    BASE=`basename $NAME`
    if [ -e $BASE ]
    then
        echo -n "$BASE: exists, "
        PTR=`readlink $BASE`
        if [ -z $PTR ]
        then
            if [ -f $BASE ]
            then
                echo -n file
            elif [ -d $BASE ]
            then
                echo -n dir
            else
                echo "something we didn't expect; exiting"
                exit 1
            fi
        else
            echo -n symlink
            if [ $PTR == $NAME ] || [ $PTR == "${NAME}/" ] # L-to-R, BSD, GNU
            then
                echo -n " to the right place"
            else
                echo -n " to $PTR, weird! expected $NAME"
                echo
                echo -n faaaaaaaaaaaaaack
            fi
        fi
    echo
    else
        echo -n "$BASE: does not exist " > /dev/stderr
        echo "ln -s $NAME"
        ln -s $NAME > /dev/stderr
    fi
done
# remove obsolete dotfiles
for NAME in $($find . -maxdepth 1 -type l -name .\* \! -name .git \! -name .svn  \! -name .. \! -name . \! -name \*.sw?)
do
    PTR=`readlink $NAME`
    if [ ! -e  $PTR ]
    then
        echo "$NAME is a bad symlink, deleting" > /dev/stderr
        rm $NAME
    fi
done

cd $1
