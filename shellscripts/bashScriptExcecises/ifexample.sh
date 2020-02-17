#!/bin/bash
# input value grater than 0 prints > 0 
if test $1 -gt 0
then
        echo "$1 > 0"
fi
# input value grater than equal to 0 prints input>= 0 
if test $1 -ge 0
then
        echo "$1 >= 0"
fi
 # input value equal to 0 prints input= 0
if test $1 -eq 0
then
        echo "$1 == 0"
fi
# input value not equal to 0 prints input != 0 
if test $1 -ne 0
then
        echo "$1 != 0"
fi
# input value less than 0 prints input < 0
if test $1 -lt 0
then
        echo "$1 < 0"
fi
# input value less than equal to 0 prints input <= 0 
if test $1 -le 0
then
        echo "$1 <= 0"
fi
