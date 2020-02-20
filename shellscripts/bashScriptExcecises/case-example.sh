#!/bin/bash
#checks input value lenth and if lenth is zero sets the rental to *** Unknown vehicle ***
if [ -z $1 ]
then
  rental="*** Unknown vehicle ***"
elif [ -n $1 ] # checks the input value not null true then sets rental to input value
then
  rental=$1
fi
# checks the rental value and prints accordingly 
case $rental in
   "car") echo "CAR";;
   "van") echo "VAN";;
   "jeep") echo "JEEP";;
   "bicycle") echo "BIKE";;
   *) echo "None of the option I know of";;
esac
