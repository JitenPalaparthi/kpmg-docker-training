#!/bin/sh

echo "Hello World"

COUNTRYCODE="91"

echo $COUNTRYCODE

n="1"
#sum=`expr $x + $y`
n2=`expr $n + 1`
echo $n2

NAME="JITEN"

echo "Hello $NAME"


# File discripters
# 1> stdout
# example git 1> success.txt
# example git 2> failure.txt

# redirecting the strerr to stdout and sending it to the shell
# git 2>&1 > /dev/null 

# git 1>&2 > /dev/null

