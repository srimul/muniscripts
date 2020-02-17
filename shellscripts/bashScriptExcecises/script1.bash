#!/bin/bash
echo "ls > file_list"
#creates the file "file_list" with ls (list of files) output
ls > file_list
 
echo "ls -la >> file_list"
#appends the file "file_list" with ls -la (includes hidden files) output
ls -la >> file_list
 
echo "cat < file_list"
# prints the contents in file "file_list"
cat < file_list
