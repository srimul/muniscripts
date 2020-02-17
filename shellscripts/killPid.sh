#!/bin/bash
#This scripts kills all the python processes running on your machine
ps -ef | grep python | grep -v grep | kill $(cut -d" " -f4) 
