#!/bin/bash
#checks input value is less than 0
if test $1 -lt 0
then
        echo "$1 < 0"
fi
#checks input value is less than or equal to 0
if test $1 -le 0
then
        echo "$1 <= 0"
fi
