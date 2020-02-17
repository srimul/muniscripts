#!/bin/bash
# checks the size of the input file 
if test -s $1
then
        echo "$1 not empty file"
fi
# checks the input name is file or not
if test -f $1
then
        echo "$1 normal file. Not a directory"
fi
# checks the given file is available or not
if test -e $1
then 
    echo "$1 exists"
fi 
# checks the input name is directory or not
if test -d $1
then
        echo "$1 is directory and not a file"
fi
# checks the read permissions on input file
if test -r $1
then
        echo "$1 is read-only file"
fi
# checks the excutable permissions on input file
if test -x $1
then
        echo "$1 is executable"
fi
