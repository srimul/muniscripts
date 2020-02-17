#!/bin/bash
#provided the logged in users with accending order
who | sort
#creates a file user_list with logged in users in accending order
who | sort > user_list
#gets the logged in users count
who | wc -l
# gives the count from ls command
ls -l | wc -l
# gets the logged in user name with cZ
who | grep cZ
