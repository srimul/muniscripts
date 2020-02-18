#!/bin/bash
string_null=""
string1="string1"
#checks the string is null or not 
if [ "$string_null" -n ]
then
        echo "not null string"
else
        echo "null string"
fi
#checks the length of the string length is zero true else flase 
if [ "$string_null" -z ]
then
        echo "null string"
else
        echo "not null string"
fi
 # checks the strings are equal or not
if [ "$string_null" == "$string1" ]
then
        echo "strings equal"
else
        echo "strings not equal"
fi
 # checks the strings are not equal
if [ "$string_null" != "$string1" ]
then
        echo "strings not equal"
else
        echo "strings equal"
fi
