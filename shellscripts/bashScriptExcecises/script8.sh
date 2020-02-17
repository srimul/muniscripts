#!/bin/sh
#checks commandline line arugument is provided or not
if [ $# -eq 0 ]
then
echo "Error - Number missing form command line argument"
echo "Syntax : $0 number"
echo "Use to print multiplication table for given number"
exit 1
fi
# reads the value
n=$1
for i in 1 2 3 4 5 6 7 8 9 10 #or for ((  i =     0 ;  i <= 10;  i++  ))
do
# prints the multiplication table for Input number
echo "$n * $i = `expr $i \* $n`"
done
